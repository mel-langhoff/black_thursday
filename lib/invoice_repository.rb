require "./lib/modify_object_attributes"
require "./lib/queries"
require "./lib/load_files"

class InvoiceRepository
    include ModifyObjectAttributes
    include Queries
    include LoadFiles
    attr_accessor :invoices

    def initialize(invoice_file_path)
        @invoices = []
        load_invoices(invoice_file_path)
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