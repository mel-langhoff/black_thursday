class SalesEngine
    attr_reader :items, :merchants, :item_file_path, :merchant_file_path, :list_of_all_items, :list_of_all_merchants, :file_paths, :invoices
    def initialize
        @items = []
        @merchants = []
        @invoices = []
    end

    def self.from_csv(file_paths)
        sales_engine = SalesEngine.new
        sales_engine.load_items(file_paths[:items])
        sales_engine.load_merchants(file_paths[:merchants])
        sales_engine.load_invoices(file_paths[:invoices])
        sales_engine
    end

    def load_invoices(invoice_file_path)
        CSV.foreach(invoice_file_path, headers: true) do |row|
            id = row["id"].to_i
            customer_id = row["customer_id"].to_i
            merchant_id = row["merchant_id"].to_i
            status = row["status"]
            created_at = row["created_at"]
            updated_at = row["updated_at"]
            invoice_attributes = {
                id: id,
                customer_id: customer_id,
                merchant_id: merchant_id,
                status: status,
                created_at: created_at,
                updated_at: updated_at
            }
            @invoices << Invoice.new(invoice_attributes)
        end
    end

    def load_items(item_file_path)
        item_repository = ItemRepository.new(item_file_path)
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
        @items = item_repository
        @list_of_all_items = item_repository.items
        item_repository
    end

    def load_merchants(merchant_file_path)
        merchant_repository = MerchantRepository.new(merchant_file_path)
        CSV.foreach(merchant_file_path, headers: true) do |row|
            id = row["id"].to_i
            name = row["name"]
            created_at = row["created_at"]
            updated_at = row["updated_at"]
            @merchants << Merchant.new(id: id.to_i, name: name, created_at: created_at, updated_at: updated_at)
        end
        @merchants = merchant_repository
        @list_of_all_merchants = merchant_repository.merchants
        merchant_repository
    end

    def analyst
        SalesAnalyst.new
    end
end