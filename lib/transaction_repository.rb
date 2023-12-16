require "./lib/modify_object_attributes"
require "./lib/queries"
class TransactionRepository
    include Queries
    include ModifyObjectAttributes
    
    attr_accessor :transactions, :id, :invoice_id, :credit_card_number, :credit_card_expiration_date, :result, :created_at, :updated_at

    def initialize(transactions_file_path)
        @transactions = []
        load_transactions(transactions_file_path)
    end

    def load_transactions(transactions_file_path)
        CSV.foreach(transactions_file_path, headers: true) do |attributes|
            id = attributes["id"].to_i
            invoice_id = attributes["invoice_id"]
            credit_card_number = attributes["credit_card_number"]
            credit_card_expiration_date = attributes["credit_card_expiration_date"]
            result = attributes["result"]
            created_at = Date.today - 1
            updated_at = Date.today
            attributes = {
                id: id.to_i,
                invoice_id: invoice_id,
                credit_card_number: credit_card_number,
                credit_card_expiration_date: credit_card_expiration_date,
                result: result,
                created_at: created_at,
                updated_at: updated_at
            }
            @transactions << Transaction.new(attributes)
        end
    end

    def all
        @transactions
    end

    def find_all_by_credit_card_number(credit_card_number)
        @transactions.select do |transaction|
        transaction.credit_card_number.to_s.include?(credit_card_number.to_s)
        end
    end

    def new(attributes)
        Transaction.new(attributes)
    end
end