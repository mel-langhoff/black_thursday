class MerchantRepository
    attr_accessor :merchants

    def initialize(merchant_file_path)
        @merchants = []
        load_merchants(merchant_file_path)
    end

    def load_merchants(merchant_file_path)
        CSV.foreach(merchant_file_path, headers: true) do |row|
            id = row["id"].to_i
            name = row["name"]
            created_at = row["created_at"]
            updated_at = row["updated_at"]
            @merchants << Merchant.new(id: id.to_i, name: name, created_at: created_at, updated_at: updated_at)
        end
    end

    def all
        @merchants
    end

    def find_by_id(id)
        @merchants.find do |merchant|
            merchant.id == id
        end
    end

    def find_by_name(name)
        @merchants.find do |merchant|
            merchant.name.downcase == name.downcase
        end
    end

    def find_all_by_name(name)
        @merchants.find_all do |merchant|
            merchant.name.downcase.include?(name.downcase)
        end
    end

    def create(merchant_attributes)
        highest_id = @merchants.map(&:id).max || 0
        new_id = highest_id + 1
        merchant_attributes["id"] = new_id
        new_merchant = Merchant.new(merchant_attributes)
        @merchants << new_merchant
        new_merchant
    end

    def update(id, merchant_attributes)
        merchant_to_update = find_by_id(id)
        if merchant_to_update
          merchant_to_update.name = merchant_attributes[:name] if merchant_attributes[:name]
        end
        merchant_to_update
    end

    def delete(id)
        @merchants.reject! do |merchant|
            merchant.id == id
        end
    end


end