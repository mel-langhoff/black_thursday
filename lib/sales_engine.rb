class SalesEngine
    attr_reader :customers, :transactions, :items, :merchants, :invoices

    def self.from_csv(file_paths)
        sales_engine = SalesEngine.new
        sales_engine.load_items(file_paths[:items])
        sales_engine.load_merchants(file_paths[:merchants])
        sales_engine.load_invoices(file_paths[:invoices])
        sales_engine.load_transactions(file_paths[:transactions])
        sales_engine.load_customers(file_paths[:customers])
        sales_engine
    end

    def load_customers(customers_file_path)
        @customers = []
        CSV.foreach(customers_file_path, headers: true) do |customer_attributes|
            id = customer_attributes["id"].to_i
            first_name = customer_attributes["first_name"]
            last_name = customer_attributes["last_name"]
            created_at = Date.today - 1
            updated_at = Date.today
            customer_attributes = {
                id: id.to_i,
                first_name: first_name,
                last_name: last_name,
                created_at: created_at,
                updated_at: updated_at
            }
            @customers << Customer.new(customer_attributes)
        end
        @customers
    end

    def load_transactions(transactions_file_path)
        @transactions = []
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
        @transactions   
    end

    def load_invoices(invoice_file_path)
        @invoices = []
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
        @invoices
    end

    def load_items(item_file_path)
        @items = []
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
        @items
    end

    def load_merchants(merchant_file_path)
        @merchants = []
        merchant_repository = MerchantRepository.new(merchant_file_path)
        CSV.foreach(merchant_file_path, headers: true) do |row|
            id = row["id"].to_i
            name = row["name"]
            created_at = row["created_at"]
            updated_at = row["updated_at"]
            @merchants << Merchant.new(id: id.to_i, name: name, created_at: created_at, updated_at: updated_at)
        end
        @merchants 
    end

    def analyst
        SalesAnalyst.new
    end
end

# class SalesEngine
#     attr_reader :customers, :transactions, :items, :merchants, :invoices
  
#     def self.from_csv(file_paths)
#       sales_engine = SalesEngine.new
#       sales_engine.load_data(file_paths[:customers], CustomerRepository, Customer)
#       sales_engine.load_data(file_paths[:transactions], TransactionRepository, Transaction)
#       sales_engine.load_data(file_paths[:invoices], InvoiceRepository, Invoice)
#       sales_engine.load_data(file_paths[:items], ItemRepository, Item)
#       sales_engine.load_data(file_paths[:merchants], MerchantRepository, Merchant)
#       sales_engine
#     end
  
#     def load_data(file_path, repository_class, entity_class)
#       repository = repository_class.new(file_path)
#       entities = []
  
#       CSV.foreach(file_path, headers: true) do |row|
#         attributes = row.to_h
#         entities << entity_class.new(attributes)
#       end
  
#       instance_variable_set("@#{repository_class.name.split('Repository').first.downcase}", entities)
#     end
  
#     def analyst
#       SalesAnalyst.new
#     end
#   end
  