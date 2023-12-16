require "./lib/modify_object_attributes"
class CustomerRepository
include ModifyObjectAttributes
    attr_accessor :customers

    def initialize(customers_file_path)
        @customers = []
        load_customers(customers_file_path)
    end

    def load_customers(customers_file_path)
        CSV.foreach(customers_file_path, headers: true) do |attributes|
            id = attributes["id"].to_i
            first_name = attributes["first_name"]
            last_name = attributes["last_name"]
            created_at = Date.today - 1
            updated_at = Date.today
            attributes = {
                id: id.to_i,
                first_name: first_name,
                last_name: last_name,
                created_at: created_at,
                updated_at: updated_at
            }
            @customers << Customer.new(attributes)
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
        @customers.select do |customer|
        customer.first_name.to_s.include?(first_name.to_s)
        end
    end

    def find_all_by_last_name(last_name)
        @customers.select do |customer|
        customer.last_name.to_s.include?(last_name.to_s)
        end
    end

    # def create(customer_attributes)
    #     highest_id = @customers.map(&:id).max.to_i
    #     # @customers.map { |customer| customer.id }
    #     new_id = highest_id + 1
    #     customer_attributes["id"] = new_id
    #     new_customer = Customer.new(customer_attributes)
    #     @customers << new_customer
    #     new_customer
    # end

    def new(attributes)
        Customer.new(attributes)
    end

    # def update(id, attributes)
    #     customer_to_update = find_by_id(id)
    #     if customer_to_update
    #         customer_to_update.first_name = attributes[:first_name]
    #     end
    #     customer_to_update
    # end

    def delete(id)
        @customers.reject! do |customer|
            customer.id.to_i == id.to_i
        end
    end
end