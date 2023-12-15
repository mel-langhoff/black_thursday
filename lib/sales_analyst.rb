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