require "./lib/modify_object_attributes"
require "./lib/queries"
require "./lib/load_files"

class ItemRepository
    include Queries
    include ModifyObjectAttributes
    include LoadFiles
    
    attr_accessor :items

    def initialize(item_file_path)
        @items = []
        load_items(item_file_path)
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