
class SalesEngine


    attr_reader :file_paths, :customers, :transactions, :items, :merchants, :invoices

    def initialize
        @customers = []
        @transactions = []
        @items = []
        @merchants = []
        @invoices = []
    end

    def self.from_csv(file_paths)
        
            @sales_engine = SalesEngine.new
            @sales_engine.load_items(file_paths[:items])
            @sales_engine.load_merchants(file_paths[:merchants])
            @sales_engine.load_invoices(file_paths[:invoices])
            @sales_engine.load_transactions(file_paths[:transactions])
            @sales_engine.load_customers(file_paths[:customers])
            @sales_engine
        end

        def load_transactions(transactions_file_path)
            @transactions = []
            CSV.foreach(transactions_file_path, headers: true) do |transaction_attributes|
                id = transaction_attributes["id"].to_i
                invoice_id = transaction_attributes["invoice_id"].to_i
                credit_card_number = transaction_attributes["credit_card_number"]
                credit_card_expiration_date = transaction_attributes["credit_card_expiration_date"]
                result = transaction_attributes["result"]
                created_at = Date.today - 1
                updated_at = Date.today
                transaction_attributes = {
                    id: id.to_i,
                    invoice_id: invoice_id.to_i,
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

        def load_invoice_items(invoice_items_file_path)
            CSV.foreach(invoice_items_file_path, headers: true) do |invoice_item_attributes|
                id = invoice_item_attributes["id"].to_i
                item_id = invoice_item_attributes["item_id"].to_i
                invoice_id = invoice_item_attributes["invoice_id"].to_i
                quantity = invoice_item_attributes["quantity"].to_i
                unit_price = invoice_item_attributes["unit_price"]
                created_at = Date.today - 1
                updated_at = Date.today
                invoice_item_attributes = {
                    id: id.to_i,
                    item_id: item_id.to_i,
                    invoice_id: invoice_id.to_i,
                    quantity: quantity,
                    unit_price: unit_price,
                    created_at: created_at,
                    updated_at: updated_at
                }
                @invoice_items << InvoiceItem.new(invoice_item_attributes)
            end
            @invoice_items
        end


    def load_invoices(invoice_file_path)
        CSV.foreach(invoice_file_path, headers: true) do |row|
            id = row["id"].to_i
            customer_id = row["customer_id"].to_i
            merchant_id = row["merchant_id"].to_i
            status = row["status"]
            created_at = Date.today - 1
            updated_at = Date.today
            invoice_attributes = {
                id: id.to_i,
                customer_id: customer_id.to_i,
                merchant_id: merchant_id.to_i,
                status: status,
                created_at: created_at,
                updated_at: updated_at
            }
            @invoices << Invoice.new(invoice_attributes)
        end
        @invoices
    end


        def load_merchants(merchant_file_path)
            CSV.foreach(merchant_file_path, headers: true) do |row|
                id = row["id"].to_i
                name = row["name"]
                created_at = Date.today - 1
                updated_at = Date.today
                @merchants << Merchant.new(id: id.to_i, name: name, created_at: created_at, updated_at: updated_at)
            end
            @merchants
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
    
        
    def load_items(item_file_path)
        CSV.foreach(item_file_path, headers: true) do |row|
            id = row["id"].to_i
            name = row["name"]
            description = row["description"]
            unit_price = row["unit_price"]
            merchant_id = row["merchant_id"]
            created_at = row["created_at"]
            updated_at = row["updated_at"]
            @items << Item.new(id: id, name: name, description: description, unit_price: unit_price, merchant_id: merchant_id, created_at: created_at, updated_at: updated_at)
        end
    end


    def analyst
        SalesAnalyst.new
    end
end