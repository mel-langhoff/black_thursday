require "./lib/modify_object_attributes"
require "./lib/queries"
require "./lib/load_files"

class CustomerRepository
    include ModifyObjectAttributes
    include Queries
    include LoadFiles

    attr_accessor :customers

    def initialize(customers_file_path)
        @customers = []
        load_customers(customers_file_path)
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