class CustomerRepository
    attr_accessor :customers

    def initialize
        @customers = []
        load_customers(customers_file_path)
    end

    def load_customers(customers_file_path)
        CSV.foreach(customers_file_path, headers: true) do |customer_attributes|
            id = customer_attributes["id"].to_i
            first_name = customer_attributes["first_name"]
            last_name = customer_attributes["last_name"]
            created_at = Date.today - 1
            updated_at = Date.today
            transaction_attributes = {
                id: id.to_i,
                first_name: first_name,
                last_name: last_name,
                created_at: created_at,
                updated_at: updated_at
            }
            @customers << Customer.new(customer_attributes)
        end
    end

    def all
        @customers
    end

    # def find_by_id(id)
    #     @transactions.find do |transaction|
    #         transaction.id.to_i == id.to_i
    #     end
    # end

    # def find_all_by_invoice_id(invoice_id)
    #     @transactions.find_all do |transaction|
    #     transaction.invoice_id.to_s.include?(invoice_id.to_s)
    #     end
    # end

    # def find_all_by_credit_card_number(credit_card_number)
    #     @transactions.find_all do |transaction|
    #     transaction.credit_card_number.to_s.include?(credit_card_number.to_s)
    #     end
    # end

    # def create(transaction_attributes)
    #     new_transaction = Transaction.new(transaction_attributes)
    #     @transactions << new_transaction
    #     new_transaction
    # end

    # def update(id, transaction_attributes)
    #     transaction_to_update = find_by_id(id)
    #     if transaction_to_update
    #         transaction_to_update.result = transaction_attributes[:result]
    #     end
    #     transaction_to_update

    # end

    # def delete(id)
    #     @transactions.reject! do |transaction|
    #         transaction.id.to_i == id.to_i
    #     end
    # end
end