require "csv"
class ItemRepository
    attr_accessor :items

    def initialize(item_file_path)
        @items = []
        load_items(item_file_path)
    end

    def load_items(item_file_path)
        CSV.foreach(item_file_path, headers: true) do |row|
            id = row["id"].to_i
            name = row["name"]
            description = row["description"]
            unit_price = row["unit_price"]
            merchant_id = row["merchant_id"]
            created_at = row["created_at"]
            updated_at = row["updated_at"]
            @items << Item.new(id: id.to_i, name: name, description: description, unit_price: unit_price, merchant_id: merchant_id, created_at: created_at, updated_at: updated_at)
        end
    end

    def all
        @items
    end

    def find_by_id(id)
        @items.find do |item|
            item.id == id
        end
    end

    def find_by_name(name)
        @items.find do |item|
            item.name.downcase == name.downcase
        end
    end

    # def find_all_by_name(name)
    #     @items.find_all do |item|
    #         item.name.downcase.include?(name.downcase)
    #     end
    # end

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

    def find_all_by_merchant_id(merchant_id)
        @items.select do |item|
            item.merchant_id.to_s.include?(merchant_id.to_s)
        end
    end

    def find_all_by_price_range(range)
        @items.select do |item|
            range.include?(item.unit_price)
        end
    end

    def create(item_attributes)
        highest_id = @items.map(&:id).max.to_i
        new_id = highest_id + 1
        item_attributes["id"] = new_id
        new_item = Item.new(item_attributes)
        @items << new_item
        new_item
    end

    def update(id, item_attributes)
        item_to_update = find_by_id(id)
        if item_to_update
            item_to_update.name = item_attributes[:name] if item_attributes[:name]
            item_to_update.description = item_attributes[:description] if item_attributes[:description]
            item_to_update.unit_price = item_attributes[:unit_price] if item_attributes[:unit_price]
            item_to_update.updated_at = Date.today
        end
        item_to_update
    end

    def delete(id)
        @items.reject! do |item|
            item.id == id
        end
    end


end