class MerchantRepository
    attr_accessor :merchants

    def initialize(file_path)
        @merchants = []
        load_merchants(file_path)
    end

    def load_merchants(file_path)
        CSV.foreach(file_path, headers: true) do |row|
            id = row["id"].to_i
            name = row["name"]
            created_at = row["created_at"]
            updated_at = row["updated_at"]
            @merchants << Merchant.new(id: id.to_i, name: name, created_at: created_at, updated_at: updated_at)
        end
    end

    def all # all - returns an array of all known Merchant instances
        @merchants
    end

    def find_by_id(id) # find_by_id(id) - returns either nil or an instance of Merchant with a matching ID
        @merchants.find do |merchant|
            merchant[:id] == id
        end
    end

    def find_by_name(name)# find_by_name(name) - returns either nil or an instance of Merchant having done a case insensitive search
        @merchants.find do |merchant|
            merchant[:name] == name
        end
    end

    def find_all_by_name(name) # find_all_by_name(name) - returns either [] or one or more matches which contain the supplied name fragment, case insensitive
        @merchants.find_all do |merchant|
            merchant.name.downcase.include?(name.downcase)
        end
    end

    def create(attributes)# create(attributes) - create a new Merchant instance with the provided attributes. The new Merchant’s id should be the current highest Merchant id plus 1.

        @merchants[:id] += 1

    end

    def update(id, attributes)# update(id, attributes) - update the Merchant instance with the corresponding id with the provided attributes. Only the merchant’s name attribute can be updated.

    end

    def delete(id)# delete(id) - delete the Merchant instance with the corresponding id


    end


end