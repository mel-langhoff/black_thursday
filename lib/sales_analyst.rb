class SalesAnalyst
    attr_accessor :items, :merchants



    def average_items_per_merchant
        total_items = @items.all.length.to_f
        total_merchants = @merchants.all.length.to_f
        (total_items / total_merchants).round(2)
    end

    def average_items_per_merchant_standard_deviation

    end

end