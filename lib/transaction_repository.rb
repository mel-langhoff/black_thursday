require "./lib/modify_object_attributes"
require "./lib/queries"
require "./lib/load_files"
class TransactionRepository
    include Queries
    include ModifyObjectAttributes
    include LoadFiles
    
    attr_accessor :transactions, :id, :invoice_id, :credit_card_number, :credit_card_expiration_date, :result, :created_at, :updated_at

    def initialize(transactions_file_path)
        @transactions = []
        load_transactions(transactions_file_path)
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