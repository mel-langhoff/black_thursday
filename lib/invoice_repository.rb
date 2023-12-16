class InvoiceRepository
    attr_accessor :invoices

    def initialize(invoice_file_path)
        @invoices = []
        load_invoices(invoice_file_path)
    end

    def load_invoices(invoice_file_path)
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
    end

    def all
        @invoices
    end

    def find_by_id(id)
        @invoices.find do |invoice|
            invoice.id == id
        end
    end

    def find_all_by_customer_id(customer_id)
        @invoices.select do |invoice|
        invoice.customer_id.to_s.include?(customer_id.to_s)
        end
    end

    def find_all_by_merchant_id(merchant_id)
        @invoices.select do |invoice|
        invoice.merchant_id.to_s.include?(merchant_id.to_s)
        end
    end

    def find_all_by_status(status)
        @invoices.select do |invoice|
        invoice.status.to_s.include?(status.to_s)
        end
    end

    def create(invoice_attributes)
        highest_id = @invoices.map(&:id).max.to_i
        new_id = highest_id + 1
        invoice_attributes["id"] = new_id
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
end