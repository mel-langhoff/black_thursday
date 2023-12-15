require "./spec/spec_helper"

RSpec.describe InvoiceItemRepository do
    before :each do
        @invoiceitemrepository = InvoiceItemRepository.new("./data/invoice_items.csv")
        @invoiceitem = InvoiceItem.new({:id => 1, :item_id => 263519844, :invoice_id => 1, :quantity => 5, :unit_price => 13635, :created_at => Date.today - 1, :updated_at => Date.today})
    end

    it "exists" do
        expect(@invoiceitemrepository).to be_an_instance_of InvoiceItemRepository
        expect(@invoiceitemrepository.invoice_items).to be_a Array
    end

    it "#all" do
        expect(@invoiceitemrepository.invoice_items.first.item_id).to eq("263519844")
    end

    it "#find_by_id" do
        expect(@invoiceitemrepository.find_by_id(1)).to be_an_instance_of InvoiceItem
        expect(@invoiceitemrepository.find_by_id(1).item_id).to eq("263519844")
    end

end
