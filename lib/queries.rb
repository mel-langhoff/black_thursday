module Queries

    def find_by_id(id)
        all.find do |attributes|
            attributes.id.to_i == id.to_i
        end
    end

    def find_all_by_customer_id(customer_id)
        all.select do |attributes|
            attributes.customer_id.to_s.include?(customer_id.to_s)
        end
    end

    def find_all_by_merchant_id(merchant_id)
        all.select do |attributes|
            attributes.merchant_id.to_s.include?(merchant_id.to_s)
        end
    end

    def find_by_name(name)
        all.find do |attributes|
            attributes.name.downcase == name.downcase
        end
    end

    def find_all_by_name(name)
        all.find_all do |attributes|
            attributes.name.downcase.include?(name.downcase)
        end
    end

    def find_all_by_invoice_id(invoice_id)
        all.select do |attributes|
            attributes.invoice_id.to_s.include?(invoice_id.to_s)
        end
    end

end