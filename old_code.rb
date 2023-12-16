# Queries

  # I FUCKING HATE RUBY SO FUCKING MUCH


#     def define_dataset
#     @dataset = load_repositories({
#             :items     => "./data/items.csv",
#             :merchants => "./data/merchants.csv",
#             :invoices => "./data/invoices.csv",
#             :transactions => "./data/transactions.csv",
#             :customers => "./data/customers.csv"
#         })
#     end

#     def determine_class
#         define_dataset
#         if self.class == CustomerRepository
#             @dataset = load_customers(customers_file_path)
#         elsif self.class == InvoiceItemRepository
#             @dataset = load_invoice_items(invoice_items_file_path)
#         elsif self.class == InvoiceRepository
#             @dataset = load_invoices(invoice_file_path)
#         elsif self.class == ItemRepository
#             @dataset = load_items(item_file_path)
#         elsif self.class == MerchantRepository
#             @dataset = load_merchants(merchant_file_path)
#         elsif self.class == TransactionRepository
#             @dataset = load_transactions(transactions_file_path)
#         end  
#     end

#     def find_by_id(id)
#         determine_class
#         @dataset.find do |id_data|
#             id_data.id.to_i == id.to_i
#         end
#     end

#     def find_all_by_invoice_id(invoice_id)
#         determine_class
#         @dataset.find_all do |invoice|
#             invoice.invoice_id.to_s.include?(invoice_id.to_s)
#         end
#     end

#     def find_by_name(name)
#         determine_class
#         @dataset.find do |data_by_name|
#             data_by_name.name.downcase == name.downcase
#         end
#     end

#     def find_all_by_name(name)
#         determine_class
#         @dataset.find_all do |data_by_name|
#             data_by_name.name.downcase.include?(name.downcase)
#         end
#     end

#     def find_all_by_merchant_id(merchant_id)
#         determine_class
#         @dataset.find_all do |data_by_merchant_id|
#             data_by_merchant_id.merchant_id.to_i.include?(merchant_id.to_i)
#         end
#     end
# end

# LoadRepositories Refactoring



    # def load_files(file_paths)
    #     instance_variable_class_name = "@#{selected_class.to_s.downcase}"
    #     instance_variable_set(instance_variable_class_name, [])
    #     CSV.foreach(file_path, headers: true) do |row|
    #         class_attributes = row.to_h.transform_keys { |attribute| attribute }
    #         class_attributes.merge!({ created_at: Date.today - 1, updated_at: Date.today })
    #         instance_variable_get(instance_variable_class_name) << selected_class.new(class_attributes)
    #     end

    # def load_files(file_path, selected_class, attributes)
    #     instance_variable_class_name = "@#{selected_class.to_s.downcase}"
    #     instance_variable_set(instance_variable_class_name, [])
    #     CSV.foreach(file_path, headers: true) do |row|
    #         class_attributes = row.to_h.transform_keys { |attribute| attribute }
    #         class_attributes.merge!({ created_at: Date.today - 1, updated_at: Date.today })
    #         instance_variable_get(instance_variable_class_name) << selected_class.new(class_attributes)
    #     end
    # end

    # def load_files(file_path, selected_class, attributes)    
    #     @selected_class_dataset = []
    #     CSV.foreach(file_path, headers: true) do |row|
    #         class_attributes = row.to_h.transform_keys(&:to_sym)
    #         class_attributes[:created_at] = Date.today - 1
    #         class_attributes[:updated_at] = Date.today
      
    #         @selected_class_dataset << selected_class.new(class_attributes)
    #     end
    #     @selected_class_dataset
    #   end

      # def determine_class_attributes2(file_paths)
    #     file_paths.each do |_, file_path|
    #         load_files_data = data_mapping(file_path)
    #         load_files(load_files_data[0], load_files_data[1], load_files_data[2])
    #     end
    #         # load_files("./data/items.csv", Item, ["id", "name", "description", "unit_price", "merchant_id"])
    #     # load_files("./data/merchants.csv", Merchant, ["id", "name"])
    #     # load_files("./data/invoices.csv", Invoice, ["id", "customer_id", "merchant_id", "status"])
    #     # load_files("./data/transactions.csv", Transaction, ["id", "invoice_id", "credit_card_number", "credit_card_expiration_date", "result"])
    #     # load_files("./data/customers.csv", Customer, ["id", "first_name", "last_name"])
    #     # load_files("./data/invoice_items.csv", InvoiceItem, ["id", "item_id", "invoice_id", "quantity", "unit_price"])
    #     # load_files(file_path, class, attributes)
    # end
    

#     def data_mapping(file_path)
#         data_mappings = [
#             ["./data/items.csv", Item, ["id".to_i, "name", "description", "unit_price", "merchant_id"]],
#             ["./data/merchants.csv", Merchant, ["id".to_i, "name"]],
#             ["./data/invoices.csv", Invoice, ["id".to_i, "customer_id", "merchant_id", "status"]],
#             ["./data/transactions.csv", Transaction, ["id".to_i, "invoice_id", "credit_card_number", "credit_card_expiration_date", "result"]],
#             ["./data/customers.csv", Customer, ["id".to_i, "first_name", "last_name"]],
#             ["./data/invoice_items.csv", InvoiceItem, ["id".to_i, "item_id", "invoice_id", "quantity", "unit_price"]]
#         ]
#         data_to_map = data_mappings.find do |load_files_arguments|
#             load_files_arguments[0] == file_path
#         end             
#     end



    # def from_csv(file_paths)
    #     file_paths.each do |_, file_path|
    #         load_files_data = data_mapping(file_path)
    #         load_files(file_path, load_files_data[1], load_files_data[2])
    #     end
    # end

    # def determine_class_attributes(file_paths)
    #     file_paths.each do |_, file_path|
    #         load_files_data = data_mapping(file_path)
    #         load_files(load_files_data[0], load_files_data[1], load_files_data[2])
    #     end
    # end

    # def self.from_csv(file_path)
    #     load_files_data = data_mapping(file_path)
    #     load_files(load_files_data[0], load_files_data[1], load_files_data[2])
    #     # load_files("./data/items.csv", Item, ["id", "name", "description", "unit_price", "merchant_id"])
    #     # load_files("./data/merchants.csv", Merchant, ["id", "name"])
    #     # load_files("./data/invoices.csv", Invoice, ["id", "customer_id", "merchant_id", "status"])
    #     # load_files("./data/transactions.csv", Transaction, ["id", "invoice_id", "credit_card_number", "credit_card_expiration_date", "result"])
    #     # load_files("./data/customers.csv", Customer, ["id", "first_name", "last_name"])
    #     # load_files("./data/invoice_items.csv", InvoiceItem, ["id", "item_id", "invoice_id", "quantity", "unit_price"])
    #     # load_files(file_path, class, attributes)
    # end
    
    # def self.from_csv(file_paths)
    #     sales_engine = SalesEngine.new
    #     sales_engine.load_items(file_paths[:items])
    #     sales_engine.load_merchants(file_paths[:merchants])
    #     sales_engine.load_invoices(file_paths[:invoices])
    #     sales_engine.load_transactions(file_paths[:transactions])
    #     sales_engine.load_customers(file_paths[:customers])
    #     sales_engine
    # end

    # def load_customers(customers_file_path)
    #     @customers = []
    #     CSV.foreach(customers_file_path, headers: true) do |customer_attributes|
    #         id = customer_attributes["id"].to_i
    #         first_name = customer_attributes["first_name"]
    #         last_name = customer_attributes["last_name"]
    #         created_at = Date.today - 1
    #         updated_at = Date.today
    #         customer_attributes = {
    #             id: id.to_i,
    #             first_name: first_name,
    #             last_name: last_name,
    #             created_at: created_at,
    #             updated_at: updated_at
    #         }
    #         @customers << Customer.new(customer_attributes)
    #     end
    #     @customers
    # end

    # def load_transactions(transactions_file_path)
    #     @transactions = []
    #     CSV.foreach(transactions_file_path, headers: true) do |transaction_attributes|
    #         id = transaction_attributes["id"].to_i
    #         invoice_id = transaction_attributes["invoice_id"]
    #         credit_card_number = transaction_attributes["credit_card_number"]
    #         credit_card_expiration_date = transaction_attributes["credit_card_expiration_date"]
    #         result = transaction_attributes["result"]
    #         created_at = Date.today - 1
    #         updated_at = Date.today
    #         transaction_attributes = {
    #             id: id.to_i,
    #             invoice_id: invoice_id,
    #             credit_card_number: credit_card_number,
    #             credit_card_expiration_date: credit_card_expiration_date,
    #             result: result,
    #             created_at: created_at,
    #             updated_at: updated_at
    #         }
    #         @transactions << Transaction.new(transaction_attributes)
    #     end
    #     @transactions   
    # end

    # def load_invoices(invoice_file_path)
    #     @invoices = []
    #     invoice_repository = InvoiceRepository.new(invoice_file_path)
    #     CSV.foreach(invoice_file_path, headers: true) do |row|
    #         id = row["id"].to_i
    #         customer_id = row["customer_id"].to_i
    #         merchant_id = row["merchant_id"].to_i
    #         status = row["status"]
    #         created_at = row["created_at"]
    #         updated_at = row["updated_at"]
    #         invoice_attributes = {
    #             id: id,
    #             customer_id: customer_id,
    #             merchant_id: merchant_id,
    #             status: status,
    #             created_at: created_at,
    #             updated_at: updated_at
    #         }
    #         @invoices << Invoice.new(invoice_attributes)
    #     end
    #     @invoices
    # end

    # def load_items(item_file_path)
    #     @items = []
    #     item_repository = ItemRepository.new(item_file_path)
    #     CSV.foreach(item_file_path, headers: true) do |row|
    #         id = row["id"].to_i
    #         name = row["name"]
    #         description = row["description"]
    #         unit_price = row["unit_price"]
    #         merchant_id = row["merchant_id"]
    #         created_at = row["created_at"]
    #         updated_at = row["updated_at"]
    #         @items << Item.new(id: id.to_i, name: name, description: description, unit_price: unit_price, merchant_id: merchant_id, created_at: created_at, updated_at: updated_at)
    #     end
    #     @items
    # end

    # def load_merchants(merchant_file_path)
    #     @merchants = []
    #     merchant_repository = MerchantRepository.new(merchant_file_path)
    #     CSV.foreach(merchant_file_path, headers: true) do |row|
    #         id = row["id"].to_i
    #         name = row["name"]
    #         created_at = row["created_at"]
    #         updated_at = row["updated_at"]
    #         @merchants << Merchant.new(id: id.to_i, name: name, created_at: created_at, updated_at: updated_at)
    #     end
    #     @merchants 
    # end


    
