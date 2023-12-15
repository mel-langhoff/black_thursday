class InvoiceItem
    attr_accessor :id, :item_id, :invoice_id, :quantity, :unit_price, :created_at, :updated_at

    def initialize(invoice_item_attributes)
        @id = invoice_item_attributes[:id]
        @item_id = invoice_item_attributes[:item_id]
        @invoice_id = invoice_item_attributes[:invoice_id]
        @quantity = invoice_item_attributes[:quantity]
        @unit_price = invoice_item_attributes[:unit_price]
        @created_at = Date.today - 1
        @updated_at = Date.today
    end

    def unit_price_to_dollars
        @unit_price.to_f / 100
    end
end

