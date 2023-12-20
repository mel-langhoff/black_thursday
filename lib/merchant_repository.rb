require "./lib/modify_object_attributes"
require "./lib/queries"
require "./lib/load_files"

class MerchantRepository
    include Queries
    include ModifyObjectAttributes
    include LoadFiles
    
    attr_accessor :merchants

    def initialize(merchant_file_path)
        @merchants = []
        load_merchants(merchant_file_path)
    end

    def all
        @merchants
    end

    def new(attributes)
        Merchant.new(attributes)
    end

end