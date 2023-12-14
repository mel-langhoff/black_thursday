class Item
    attr_accessor :id, :name, :description, :unit_price, :merchant_id, :created_at, :updated_at

    def initialize(item_attributes)
        @id = item_attributes[:id]
        @name = item_attributes[:name]
        @description = item_attributes[:description]
        @unit_price = item_attributes[:unit_price]
        @merchant_id = item_attributes[:merchant_id]
        @created_at = Date.today - 1
        @updated_at = Date.today
    end
end