
class InvoiceRepository


    attr_accessor :invoices

    def initialize(invoice_file_path)
        @invoices = []

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

    def all
        @invoices
    end

    def find_by_id(id)
        @invoices.find do |invoice|
            invoice.id == id
        end
    end

    def find_all_by_customer_id(customer_id)
        @invoices.find_all do |invoice|
        invoice.customer_id.to_s.include?(customer_id.to_s)
        end
    end

    def find_all_by_merchant_id(merchant_id)
        @invoices.find_all do |invoice|
        invoice.merchant_id.to_s.include?(merchant_id.to_s)
        end
    end

    def find_all_by_status(status)
        @invoices.find_all do |invoice|
        invoice.status.to_s.include?(status.to_s)
        end
    end

    # def create(invoice_attributes)
    #     new_invoice = Invoice.new(invoice_attributes)
    #     @invoices << new_invoice
    #     new_invoice
    # end

    # def update(id, invoice_attributes)
    #     invoice_to_update = find_by_id(id)
    #     if invoice_to_update
    #         invoice_to_update.status = invoice_attributes[:status]
    #     end
    #     invoice_to_update
    # end

    # def delete(id)
    #     @invoices.reject! do |invoice|
    #         invoice.id == id
    #     end
    # end
end

