require "./lib/modify_object_attributes"
require "./lib/queries"
class ItemRepository
    include Queries
    include ModifyObjectAttributes
    
    attr_accessor :items

    def initialize(item_file_path)
        @items = []
        load_items(item_file_path)
    end

    def load_items(item_file_path)
        CSV.foreach(item_file_path, headers: true) do |attributes|
            id = attributes["id"].to_i
            name = attributes["name"]
            description = attributes["description"]
            unit_price = attributes["unit_price"]
            merchant_id = attributes["merchant_id"]
            created_at = Date.today - 1
            updated_at = Date.today
            attributes = {
                id: id.to_i, 
                name: name, 
                description: description, 
                unit_price: unit_price, 
                merchant_id: merchant_id, 
                created_at: created_at, 
                updated_at: updated_at
            }
            @items << Item.new(attributes)
        end
    end

    def all
        @items
    end

    def find_all_by_description(description)
        @items.select do |item|
            item.description.downcase.include?(description.downcase)
        end
    end

    def find_all_by_price(unit_price)
        @items.select do |item|
            item.unit_price.to_s.include?(unit_price.to_s)
        end
    end

    def find_all_by_price_range(range)
        @items.select do |item|
            range.include?(item.unit_price.to_f)
        end
    end

    def new(attributes)
        Item.new(attributes)
    end

end