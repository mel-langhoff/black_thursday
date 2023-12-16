require "./lib/modify_object_attributes"
require "./lib/queries"
class CustomerRepository
    include ModifyObjectAttributes
    include Queries

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

    def new(attributes)
        Customer.new(attributes)
    end

end