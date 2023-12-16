module AlterData

#create
    def create(transaction_attributes)
        new_transaction = Transaction.new(transaction_attributes)
        @transactions << new_transaction
        new_transaction
    end

    def create(merchant_attributes)
        highest_id = @merchants.map(&:id).max || 0
        new_id = highest_id + 1
        merchant_attributes["id"] = new_id
        new_merchant = Merchant.new(merchant_attributes)
        @merchants << new_merchant
        new_merchant
    end

    def create(invoice_attributes)
        new_invoice = Invoice.new(invoice_attributes)
        @invoices << new_invoice
        new_invoice
    end

    def create(customer_attributes)
        new_customer = Customer.new(customer_attributes)
        @customers << new_customer
        new_customer
    end

    def create(invoice_item_attributes)
        new_invoice_item = InvoiceItem.new(invoice_item_attributes)
        @invoice_items << new_invoice_item
        new_invoice_item
    end

    def create(item_attributes)
        highest_id = @items.map(&:id).max || 0
        new_id = highest_id + 1
        item_attributes["id"] = new_id
        new_item = Item.new(item_attributes)
        @items << new_item
        new_item
    end
    
    

#update
    def update(id, transaction_attributes)
        transaction_to_update = find_by_id(id)
        if transaction_to_update
            transaction_to_update.result = transaction_attributes[:result]
        end
        transaction_to_update
    end

    def update(id, merchant_attributes)
        merchant_to_update = find_by_id(id)
        if merchant_to_update
          merchant_to_update.name = merchant_attributes[:name]
        end
        merchant_to_update
    end

    def update(id, invoice_attributes)
        invoice_to_update = find_by_id(id)
        if invoice_to_update
            invoice_to_update.status = invoice_attributes[:status]
        end
        invoice_to_update
    end

    def update(id, customer_attributes)
        customer_to_update = find_by_id(id)
        if customer_to_update
            customer_to_update.first_name = customer_attributes[:first_name]
        end
        customer_to_update
    end
    
    def update(id, invoice_item_attributes)
        invoice_item_to_update = find_by_id(id)
        if invoice_item_to_update
            invoice_item_to_update.quantity = invoice_item_attributes[:quantity]
        end
        invoice_item_to_update    
    end

    def update(id, item_attributes)
        item_to_update = find_by_id(id)
        if item_to_update
          item_to_update.name = item_attributes[:name] if item_attributes[:name]
        end
        item_to_update
    end
    
#delete
    def delete(id)
        @transactions.reject! do |transaction|
            transaction.id.to_i == id.to_i
        end
    end

    def delete(id)
        @merchants.reject! do |merchant|
            merchant.id == id
        end
    end

    def delete(id)
        @invoices.reject! do |invoice|
            invoice.id == id
        end
    end

    def delete(id)
        @customers.reject! do |customer|
            customer.id.to_i == id.to_i
        end
    end

        
    def delete(id)
        @invoice_items.reject! do |invoice_item|
            invoice_item.id.to_i == id.to_i
        end
    end
    
    def delete(id)
        @items.reject! do |item|
            item.id == id
        end
    end


MerchantRepository
    def create(merchant_attributes)
        highest_id = @merchants.map(&:id).max || 0
        new_id = highest_id + 1
        merchant_attributes["id"] = new_id
        new_merchant = Merchant.new(merchant_attributes)
        @merchants << new_merchant
        new_merchant
    end

    def update(id, merchant_attributes)
        merchant_to_update = find_by_id(id)
        if merchant_to_update
          merchant_to_update.name = merchant_attributes[:name]
        end
        merchant_to_update
    end

    def delete(id)
        @merchants.reject! do |merchant|
            merchant.id == id
        end
    end

InvoiceRepository
    def create(invoice_attributes)
        new_invoice = Invoice.new(invoice_attributes)
        @invoices << new_invoice
        new_invoice
    end

    def update(id, invoice_attributes)
        invoice_to_update = find_by_id(id)
        if invoice_to_update
            invoice_to_update.status = invoice_attributes[:status]
        end
        invoice_to_update
    end

    def delete(id)
        @invoices.reject! do |invoice|
            invoice.id == id
        end
    end

CustomerRepository
def create(customer_attributes)
    new_customer = Customer.new(customer_attributes)
    @customers << new_customer
    new_customer
end

def update(id, customer_attributes)
    customer_to_update = find_by_id(id)
    if customer_to_update
        customer_to_update.first_name = customer_attributes[:first_name]
    end
    customer_to_update
end

def delete(id)
    @customers.reject! do |customer|
        customer.id.to_i == id.to_i
    end
end

InvoiceItemRepository
def create(invoice_item_attributes)
    new_invoice_item = InvoiceItem.new(invoice_item_attributes)
    @invoice_items << new_invoice_item
    new_invoice_item
end

def update(id, invoice_item_attributes)
    invoice_item_to_update = find_by_id(id)
    if invoice_item_to_update
        invoice_item_to_update.quantity = invoice_item_attributes[:quantity]
    end
    invoice_item_to_update

end

def delete(id)
    @invoice_items.reject! do |invoice_item|
        invoice_item.id.to_i == id.to_i
    end
end

ItemRepository
def create(item_attributes)
    highest_id = @items.map(&:id).max || 0
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
    end
    item_to_update
end

def delete(id)
    @items.reject! do |item|
        item.id == id
    end
end

end