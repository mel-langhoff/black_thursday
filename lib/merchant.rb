class Merchant
    attr_accessor :id, :name, :created_at, :updated_at

    def initialize(merchant_attributes)
        @id = merchant_attributes[:id]
        @name = merchant_attributes[:name]
        @created_at = Date.today - 1
        @updated_at = Date.today
    end
end