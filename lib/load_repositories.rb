# module LoadRepositories

#     attr_accessor :sales_engine, :customers, :transactions, :items, :merchants, :invoices



#   def initialize
#     @customers = []
#     @transactions = []
#     @items = []
#     @merchants = []
#     @invoices = []

#   end

#     def load_repositories(file_paths)
#         @sales_engine = SalesEngine.new
#         @sales_engine.load_items(file_paths[:items])
#         @sales_engine.load_merchants(file_paths[:merchants])
#         @sales_engine.load_invoices(file_paths[:invoices])
#         @sales_engine.load_transactions(file_paths[:transactions])
#         @sales_engine.load_customers(file_paths[:customers])
#         @sales_engine
#     end
    
# end