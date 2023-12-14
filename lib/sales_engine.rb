class SalesEngine
    attr_reader :items, :merchants, :item_file_path, :merchant_file_path

    def initialize
        @items = []
        @merchants = []
    end

    def self.from_csv(file_paths)
        sales_engine = SalesEngine.new
        sales_engine.load_items(file_paths[:items])
        sales_engine.load_merchants(file_paths[:merchants])
        sales_engine
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

    def load_merchants(merchant_file_path)
        CSV.foreach(merchant_file_path, headers: true) do |row|
            id = row["id"].to_i
            name = row["name"]
            created_at = row["created_at"]
            updated_at = row["updated_at"]
            @merchants << Merchant.new(id: id.to_i, name: name, created_at: created_at, updated_at: updated_at)
        end
    end

end

# se = SalesEngine.from_csv({
#   :items     => "./data/items.csv",
#   :merchants => "./data/merchants.csv",
# })
# From there we can find the child instances:

# items returns an instance of ItemRepository with all the item instances loaded
# merchants returns an instance of MerchantRepository with all the merchant instances loaded