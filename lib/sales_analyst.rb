class SalesAnalyst
    attr_accessor :items, :merchants, :item_file_path, :merchant_file_path, :file_paths, :total_merchants, :total_items, :sales_engine

    def initialize
        @items = []
        @merchants = []
    end

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

end