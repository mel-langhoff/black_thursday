module LoadFiles

    def load_invoices(invoice_file_path)
        @invoices = []
        CSV.foreach(invoice_file_path, headers: true) do |attributes|
            id = attributes["id"].to_i
            customer_id = attributes["customer_id"].to_i
            merchant_id = attributes["merchant_id"].to_i
            status = attributes["status"]
            created_at = Date.today - 1
            updated_at = Date.today
            attributes = {
                id: id,
                customer_id: customer_id,
                merchant_id: merchant_id,
                status: status,
                created_at: created_at,
                updated_at: updated_at
            }
            @invoices << Invoice.new(attributes)
        end
    end

    def load_customers(customers_file_path)
        @customers = []
        CSV.foreach(customers_file_path, headers: true) do |attributes|
            id = attributes["id"].to_i
            first_name = attributes["first_name"]
            last_name = attributes["last_name"]
            created_at = Date.today - 1
            updated_at = Date.today
            attributes = {
                id: id.to_i,
                first_name: first_name,
                last_name: last_name,
                created_at: created_at,
                updated_at: updated_at
            }
            @customers << Customer.new(attributes)
        end
    end

    def load_merchants(merchant_file_path)
        @merchants = []
        CSV.foreach(merchant_file_path, headers: true) do |attributes|
            id = attributes["id"].to_i
            name = attributes["name"]
            created_at = Date.today - 1
            updated_at = Date.today
            attributes = {
                id: id.to_i, 
                name: name, 
                created_at: created_at, 
                updated_at: updated_at
            }
            @merchants << Merchant.new(attributes)
        end
    end

    def load_items(item_file_path)
        @items = []
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

    def load_transactions(transactions_file_path)
        @transactions = []
        CSV.foreach(transactions_file_path, headers: true) do |attributes|
            id = attributes["id"].to_i
            invoice_id = attributes["invoice_id"]
            credit_card_number = attributes["credit_card_number"]
            credit_card_expiration_date = attributes["credit_card_expiration_date"]
            result = attributes["result"]
            created_at = Date.today - 1
            updated_at = Date.today
            attributes = {
                id: id.to_i,
                invoice_id: invoice_id,
                credit_card_number: credit_card_number,
                credit_card_expiration_date: credit_card_expiration_date,
                result: result,
                created_at: created_at,
                updated_at: updated_at
            }
            @transactions << Transaction.new(attributes)
        end
    end


    def load_invoice_items(invoice_items_file_path)
        CSV.foreach(invoice_items_file_path, headers: true) do |attributes|
            id = attributes["id"]
            item_id = attributes["item_id"]
            invoice_id = attributes["invoice_id"]
            quantity = attributes["quantity"]
            unit_price = attributes["unit_price"]
            created_at = Date.today - 1
            updated_at = Date.today
            attributes = {
                id: id,
                item_id: item_id,
                invoice_id: invoice_id,
                quantity: quantity,
                unit_price: unit_price,
                created_at: created_at,
                updated_at: updated_at
            }
            @invoice_items << InvoiceItem.new(attributes)
        end
    end

end
  