class ItemRepository
    attr_accessor :items

    def initialize(file_path)
        @items = []
        load_items(file_path)
    end

    def load_items(file_path)
        CSV.foreach(file_path, headers: true) do |row|
            id = row["id"].to_i
            name = row["name"]
            created_at = row["created_at"]
            updated_at = row["updated_at"]
            @items << item.new(id: id.to_i, name: name, created_at: created_at, updated_at: updated_at)
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

    def find_all_by_name(name)
        @items.find_all do |item|
            item.name.downcase.include?(name.downcase)
        end
    end

    def create(attributes)
        highest_id = @items.map(&:id).max || 0
        new_id = highest_id + 1
        attributes["id"] = new_id
        new_item = item.new(attributes)
        @items << new_item
        new_item
    end

    def update(id, attributes)
        item_to_update = find_by_id(id)
        if item_to_update
          item_to_update.name = attributes[:name] if attributes[:name]
        end
        item_to_update
    end

    def delete(id)
        @items.reject! do |item|
            item.id == id
        end
    end


end