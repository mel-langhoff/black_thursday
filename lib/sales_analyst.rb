class SalesAnalyst
    attr_accessor :list_of_all_invoices, :items, :merchants, :item_file_path, :merchant_file_path, :file_paths, :total_merchants, :total_items, :sales_engine, :item_repository, :invoices

    def average_items_per_merchant  
        @total_items = @items.items.size.to_f
        @total_merchants = @merchants.merchants.size.to_f
        (total_items / total_merchants).round(2)
    end

    def average_item_price_per_merchant(merchant_id)
        merchant_items = @items.find_all_by_merchant_id(merchant_id)    
        total_of_prices = merchant_items.sum do |item| 
            item.unit_price.to_f
        end
        average_price_of_merchant = total_of_prices / merchant_items.length
        BigDecimal(average_price_of_merchant, 2)
      end

    def average_average_price_per_merchant
        merchant_ids = @items.items.map do |item|
            item.merchant_id.to_i
        end
        merchant_averages = merchant_ids.map do |merchant_id|
            average_item_price_per_merchant(merchant_id)
        end
        total_average = merchant_averages.sum / merchant_averages.length
        BigDecimal(total_average, 2)
    end

    def average_items_per_merchant_standard_deviation
        mean = average_items_per_merchant
        squared_diff_sum = @merchants.merchants.each.reduce(0) do |sum, merchant|
            items_count = @items.find_all_by_merchant_id(merchant.id).length
            sum + (items_count - mean) ** 2
        end
        standard_deviation = Math.sqrt(squared_diff_sum / @merchants.all.length)

        standard_deviation.round(2)
    end   

    def golden_items
        average_price = average_average_price_per_merchant
        standard_deviation = average_items_per_merchant_standard_deviation
        set_limit = average_price + (standard_deviation * 2)
        @items.items.find_all do |item|
            item.unit_price.to_f > set_limit
        end
    end

    def average_invoices_per_merchant 
        total_invoices = @invoices.invoices.size.to_f
        total_merchants = @merchants.merchants.size.to_f
        (total_invoices / total_merchants).round(2)
    end

    def average_invoices_per_merchant_standard_deviation
        mean = average_invoices_per_merchant
        squared_diff_sum = @merchants.merchants.each.reduce(0) do |sum, merchant|
            invoices_count = @invoices.find_all_by_merchant_id(merchant.id).length
            sum + (invoices_count - mean) ** 2
        end
        standard_deviation = Math.sqrt(squared_diff_sum / @merchants.all.length)
        standard_deviation.round(2)
    end

    def top_merchants_by_invoice_count
        merchants_by_invoice_count = @merchants.merchants.map.sort_by do |merchant|
            @invoices.find_all_by_merchant_id(merchant.id).size
            end
        merchants_by_invoice_count
    end

    def bottom_merchants_by_invoice_count
        merchants_by_invoice_count = @merchants.merchants.map.sort_by do |merchant|
            @invoices.find_all_by_merchant_id(merchant.id).size
            end
        merchants_by_invoice_count.reverse
    end

    def top_days_by_invoice_count
        created_at_values = @invoices.invoices.map { |invoice| invoice.created_at }
    
        # Count occurrences of each date
        date_count = created_at_values.group_by do |date|
          Date.parse(date)
        end.transform_values(&:size)
    
        # Calculate mean and standard deviation
        mean = date_count.values.sum.to_f / date_count.size.to_f
        squared_diff = date_count.values.map { |count| (count - mean) ** 2 }
        standard_deviation = Math.sqrt(squared_diff.sum / date_count.size)
    
        # Filter dates more than one standard deviation above the mean
        top_days = Set.new(date_count.select { |_, count| count > (mean + standard_deviation) }.keys)
    
        top_days.map { |date| date.strftime('%A') }.uniq
      end

      def invoice_status(invoice_status)
        total_invoices = @invoices.invoices.size
        total_of_invoices_in_selected_status = @invoices.invoices.status[invoice_status]
        (total_pending.to_f / total_invoices.to_f).round(2)
      end
end


