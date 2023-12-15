class TransactionRepository
    attr_accessor :transactions, :id, :invoice_id, :credit_card_number, :credit_card_expiration_date, :result, :created_at, :updated_at

    def initialize(transactions_file_path)
        @transactions = []
        load_transactions(transactions_file_path)
    end

    def load_transactions(transactions_file_path)
        CSV.foreach(transactions_file_path, headers: true) do |transaction_attributes|
            id = transaction_attributes["id"].to_i
            invoice_id = transaction_attributes["invoice_id"]
            credit_card_number = transaction_attributes["credit_card_number"]
            credit_card_expiration_date = transaction_attributes["credit_card_expiration_date"]
            result = transaction_attributes["result"]
            created_at = Date.today - 1
            updated_at = Date.today
            transaction_attributes = {
                id: id.to_i,
                invoice_id: invoice_id,
                credit_card_number: credit_card_number,
                credit_card_expiration_date: credit_card_expiration_date,
                result: result,
                created_at: created_at,
                updated_at: updated_at
            }
            @transactions << Transaction.new(transaction_attributes)
        end
    end

    def all
        @transactions
    end

    def find_by_id(id)
        @transactions.find do |transaction|
            transaction.id.to_i == id.to_i
        end
    end

    def find_all_by_invoice_id(invoice_id)
        @transactions.find_all do |transaction|
        transaction.invoice_id.to_s.include?(invoice_id.to_s)
        end
    end

    # def find_all_by_invoice_id(invoice_id)
    #     @invoice_items.find_all do |invoice|
    #     invoice.invoice_id.to_s.include?(invoice_id.to_s)
    #     end
    # end

    # def create(invoice_item_attributes)
    #     new_invoice_item = InvoiceItem.new(invoice_item_attributes)
    #     @invoice_items << new_invoice_item
    #     new_invoice_item
    # end

    # def update(id, invoice_item_attributes)
    #     invoice_item_to_update = find_by_id(id)
    #     if invoice_item_to_update
    #         invoice_item_to_update.quantity = invoice_item_attributes[:quantity]
    #     end
    #     invoice_item_to_update

    # end

    # def delete(id)
    #     @invoice_items.reject! do |invoice_item|
    #         invoice_item.id.to_i == id.to_i
    #     end
    # end
end