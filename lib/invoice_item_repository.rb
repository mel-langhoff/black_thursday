require "./lib/modify_object_attributes"
require "./lib/queries"
require "./lib/load_files"

class InvoiceItemRepository
    include Queries
    include ModifyObjectAttributes
    include LoadFiles

    attr_accessor :invoice_items, :id, :item_id, :invoice_id, :quantity, :unit_price, :created_at, :updated_at, :invoice_items_file_path

    def initialize(invoice_items_file_path)
        @invoice_items = []
        load_invoice_items(invoice_items_file_path)
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

    def all
        @invoice_items
    end

    def find_all_by_item_id(item_id)
        @invoice_items.select do |invoice|
        invoice.item_id.to_s.include?(item_id.to_s)
        end
    end

    def new(attributes)
        InvoiceItem.new(attributes)
    end

end