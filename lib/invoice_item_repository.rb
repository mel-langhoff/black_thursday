class InvoiceItemRepository
    attr_accessor :invoice_items, :id, :item_id, :invoice_id, :quantity, :unit_price, :created_at, :updated_at, :invoice_items_file_path

    def initialize(invoice_items_file_path)
        @invoice_items = []
        load_invoice_items(invoice_items_file_path)
    end

    def load_invoice_items(invoice_items_file_path)
        CSV.foreach(invoice_items_file_path, headers: true) do |invoice_item_attributes|
            id = invoice_item_attributes["id"]
            item_id = invoice_item_attributes["item_id"]
            invoice_id = invoice_item_attributes["invoice_id"]
            quantity = invoice_item_attributes["quantity"]
            unit_price = invoice_item_attributes["unit_price"]
            created_at = Date.today - 1
            updated_at = Date.today
            invoice_item_attributes = {
                id: id,
                item_id: item_id,
                invoice_id: invoice_id,
                quantity: quantity,
                unit_price: unit_price,
                created_at: created_at,
                updated_at: updated_at
            }
            @invoice_items << InvoiceItem.new(invoice_item_attributes)
        end
    end

    def all
        @invoice_items
    end

    def find_by_id(id)
        @invoice_items.find do |invoice_item|
            invoice_item.id.to_i == id.to_i
        end
    end

    def find_all_by_item_id(item_id)
        @invoice_items.find_all do |invoice|
        invoice.item_id.to_s.include?(item_id.to_s)
        end
    end

    def find_all_by_invoice_id(invoice_id)
        @invoice_items.find_all do |invoice|
        invoice.invoice_id.to_s.include?(invoice_id.to_s)
        end
    end

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

    # def delete(id)
    #     @invoices.reject! do |invoice|
    #         invoice.id == id
    #     end
    # end
end



# all - returns an array of all known InvoiceItem instances
# find_by_id - returns either nil or an instance of InvoiceItem with a matching ID
# find_all_by_item_id - returns either [] or one or more matches which have a matching item ID
# find_all_by_invoice_id - returns either [] or one or more matches which have a matching invoice ID
# create(attributes) - create a new InvoiceItem instance with the provided attributes. The new InvoiceItem’s id should be the current highest InvoiceItem id plus 1.
# update(id, attribute) - update the InvoiceItem instance with the corresponding id with the provided attributes. Only the invoice_item’s quantity and unit_price can be updated. This method will also change the invoice_item’s updated_at attribute to the current time.
# delete(id) - delete the InvoiceItem instance with the corresponding id