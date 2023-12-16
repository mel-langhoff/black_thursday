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