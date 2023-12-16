require "./lib/modify_object_attributes"
require "./lib/queries"
class InvoiceRepository
    include ModifyObjectAttributes
    include Queries

    attr_accessor :invoices

    def initialize(invoice_file_path)
        @invoices = []
        load_invoices(invoice_file_path)
    end

    def load_invoices(invoice_file_path)
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

    def all
        @invoices
    end

    def find_all_by_status(status)
        @invoices.select do |invoice|
        invoice.status.to_s.include?(status.to_s)
        end
    end

    def new(attributes)
        Invoice.new(attributes)
    end

end