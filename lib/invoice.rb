class Invoice
   attr_accessor :id, :customer_id, :merchant_id, :status, :created_at, :updated_at

    def initialize(invoice_attributes)
        @id = invoice_attributes[:id]
        @customer_id = invoice_attributes[:customer_id]
        @merchant_id = invoice_attributes[:merchant_id]
        @status = invoice_attributes[:status]
        @created_at = invoice_attributes[:invoice_attributes]
        @updated_at = invoice_attributes[:updated_at]
    end

end