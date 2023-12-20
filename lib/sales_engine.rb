require "./lib/load_files"

class SalesEngine
include LoadFiles

    attr_reader :customers, :transactions, :items, :merchants, :invoices

    def self.from_csv(file_paths)
        sales_engine = SalesEngine.new
        sales_engine.load_items(file_paths[:items])
        sales_engine.load_merchants(file_paths[:merchants])
        sales_engine.load_invoices(file_paths[:invoices])
        sales_engine.load_transactions(file_paths[:transactions])
        sales_engine.load_customers(file_paths[:customers])
        sales_engine
    end

    def analyst
        SalesAnalyst.new
    end
end