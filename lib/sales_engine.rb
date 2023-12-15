class SalesEngine
    attr_reader :transactions, :items, :merchants, :item_file_path, :merchant_file_path, :list_of_all_items, :list_of_all_merchants, :file_paths, :invoices
    def initialize
        @items = []
        @merchants = []
        @invoices = []
        @transactions = []
    end

    def self.from_csv(file_paths)
        sales_engine = SalesEngine.new
        sales_engine.load_items(file_paths[:items])
        sales_engine.load_merchants(file_paths[:merchants])
        sales_engine.load_invoices(file_paths[:invoices])
        sales_engine.load_transactions(file_paths[:transactions])
        sales_engine
    end

    def load_transactions(transactions_file_path)
        CSV.foreach(transactions_file_path, headers: true) do |transaction_attributes|
            id = transaction_attributes["id"].to_i
            invoice_id = transaction_attributes["invoice_id"]
            credit_card_number = transaction_attributes["credit_card_number"]
            credit_card_expiration_date = transaction_attributes["credit_card_expiration_date"]
            result = transaction_attributes["result"]
            created_at = Date.today - 1
            updated_at = Date.today
            transaction_attributes = {
                id: id.to_i,
                invoice_id: invoice_id,
                credit_card_number: credit_card_number,
                credit_card_expiration_date: credit_card_expiration_date,
                result: result,
                created_at: created_at,
                updated_at: updated_at
            }
            @transactions << Transaction.new(transaction_attributes)
        end
    end

    def load_invoices(invoice_file_path)
        invoice_repository = InvoiceRepository.new(invoice_file_path)
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
        @invoices = invoice_repository
        @list_of_all_invoices = invoice_repository.invoices
        invoice_repository
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