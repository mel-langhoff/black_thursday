class Merchant
    attr_accessor :id, :name

    def initialize(attributes)
        @id = attributes[:id]
        @name = attributes[:name]
        @created_at = Date.today - 1
        @updated_at = Date.today
    end
end