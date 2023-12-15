class Customer
    attr_accessor :id, :first_name, :last_name, :created_at, :updated_at

    def initialize(customer_attributes)
        @id = customer_attributes[:id]
        @first_name = customer_attributes[:first_name]
        @last_name = customer_attributes[:last_name]
        @created_at = Date.today - 1
        @updated_at = Date.today
    end
end