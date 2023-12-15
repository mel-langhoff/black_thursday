require "./spec/spec_helper"

RSpec.describe TransactionRepository do
    before :each do
        @transactionrepository = TransactionRepository.new("./data/transactions.csv")
    end

    it "exists" do
        expect(@transactionrepository).to be_an_instance_of TransactionRepository
        expect(@transactionrepository.transactions).to be_a Array
        expect(@transactionrepository.transactions.first).to be_an_instance_of Transaction
    end

    it "#all" do
        expect(@transactionrepository.transactions.first.invoice_id).to eq("2179")
    end

    it "#find_by_id" do
        expect(@transactionrepository.find_by_id(1)).to be_an_instance_of Transaction
        expect(@transactionrepository.find_by_id(1).invoice_id).to eq("2179")
    end

    it "#find_all_by_invoice_id" do
        invoices_by_id = @transactionrepository.find_all_by_invoice_id(1)
        expect(invoices_by_id).to be_a Array
        expect(invoices_by_id.first).to be_an_instance_of Transaction
        expect(invoices_by_id.first.credit_card_number).to eq("4068631943231473")
    end

    xit "#find_all_by_credit_card_number" do
        queried_credit_card_number = @transactionrepository.find_all_by_credit_card_number(4068631943231473)
        expect(queried_credit_card_number).to be_a Array
        expect(queried_credit_card_number.first).to be_an_instance_of InvoiceItem
        expect(queried_credit_card_number.first.invoice_id).to eq(1)
    end

    it "#create" do
        initial_count = @transactionrepository.transactions.length
        transaction_attributes = ({
            :id => 6,
            :invoice_id => 8,
            :credit_card_number => "4242424242424242",
            :credit_card_expiration_date => "0220",
            :result => "success",
            :quantity => 3,
            :created_at => Date.today - 1,
            :updated_at => Date.today
          })
        new_transaction = @transactionrepository.create(transaction_attributes)

        expect(new_transaction).to be_an_instance_of Transaction
        expect(new_transaction.id).to eq(6)
        expect(new_transaction.result).to eq("success")
        expect(@transactionrepository.transactions.length).to eq(initial_count + 1)
    end

    xit "#update" do
        original_quantity = { id: 1, quantity: "5" }
        @invoiceitemrepository.create(original_quantity)

        updated_quantity = { id: 1, quantity: "6" }
        updated_invoice_item = @invoiceitemrepository.update(1, updated_quantity)

        expect(updated_invoice_item.quantity).to eq("6")
        expect(updated_invoice_item).to be_an_instance_of InvoiceItem
    end

    xit "#delete" do
        attributes = { id: 1, item_id: "263519844" }
        @invoiceitemrepository.create(attributes)

        expect(@invoiceitemrepository.find_by_id(1)).to be_an_instance_of InvoiceItem

        @invoiceitemrepository.delete(1)

        expect(@invoiceitemrepository.find_by_id(1)).to be_nil
    end

end