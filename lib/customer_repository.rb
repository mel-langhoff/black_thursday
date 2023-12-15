class CustomerRepository
    attr_accessor :customers

    def initialize(customers_file_path)
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
            customer_attributes = {
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

    def find_by_id(id)
        @customers.find do |customer|
            customer.id.to_i == id.to_i
        end
    end

    def find_all_by_first_name(first_name)
        @customers.find_all do |customer|
        customer.first_name.to_s.include?(first_name.to_s)
        end
    end

    def find_all_by_last_name(last_name)
        @customers.find_all do |customer|
        customer.last_name.to_s.include?(last_name.to_s)
        end
    end

    def create(customer_attributes)
        new_customer = Customer.new(customer_attributes)
        @customers << new_customer
        new_customer
    end

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