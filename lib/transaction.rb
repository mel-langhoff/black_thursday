class Transaction
    attr_accessor :id, :invoice_id, :credit_card_number, :credit_card_expiration_date, :result, :created_at, :updated_at

    def initialize(transaction_attributes)
        @id = transaction_attributes[:id]
        @invoice_id = transaction_attributes[:invoice_id]
        @credit_card_number = transaction_attributes[:credit_card_number]
        @credit_card_expiration_date = transaction_attributes[:credit_card_expiration_date]
        @result = transaction_attributes[:result]
        @created_at = Date.today - 1
        @updated_at = Date.today
    end

end