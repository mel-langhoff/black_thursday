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

    xit "#find_all_by_invoice_id" do
        all_invoice_ids = @invoiceitemrepository.find_all_by_invoice_id(1)
        expect(all_invoice_ids).to be_a Array
        expect(all_invoice_ids.first).to be_an_instance_of InvoiceItem
        expect(all_invoice_ids.first.unit_price).to eq("13635")
    end

    xit "#create" do
        initial_count = @invoiceitemrepository.invoice_items.length
        invoice_item_attributes = ({:id => 1, :item_id => 263519844, :invoice_id => 1, :quantity => 5, :unit_price => 13635, :created_at => Date.today - 1, :updated_at => Date.today})
        new_invoice_item = @invoiceitemrepository.create(invoice_item_attributes)

        expect(new_invoice_item).to be_an_instance_of InvoiceItem
        expect(new_invoice_item.id).to eq(1)
        expect(new_invoice_item.unit_price).to eq(13635)
        expect(@invoiceitemrepository.invoice_items.length).to eq(initial_count + 1)
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