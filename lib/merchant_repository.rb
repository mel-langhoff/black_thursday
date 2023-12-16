require "./lib/modify_object_attributes"
require "./lib/queries"
class MerchantRepository
    include Queries
    include ModifyObjectAttributes
    
    attr_accessor :merchants

    def initialize(merchant_file_path)
        @merchants = []
        load_merchants(merchant_file_path)
    end

    def load_merchants(merchant_file_path)
        CSV.foreach(merchant_file_path, headers: true) do |attributes|
            id = attributes["id"].to_i
            name = attributes["name"]
            created_at = Date.today - 1
            updated_at = Date.today
            attributes = {
                id: id.to_i, 
                name: name, 
                created_at: created_at, 
                updated_at: updated_at
            }
            @merchants << Merchant.new(attributes)
        end
    end

    def all
        @merchants
    end

    def new(attributes)
        Merchant.new(attributes)
    end

end