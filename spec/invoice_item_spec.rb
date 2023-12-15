require "./spec/spec_helper"

RSpec.describe InvoiceItem do
    before :each do
        @invoiceitem1 = InvoiceItem.new({:id => 1, :item_id => "263519844", :invoice_id => "1", :quantity => 5, :unit_price => BigDecimal(13635), :created_at => Date.today - 1, :updated_at => Date.today})
    end

    it "exists" do
        expect(@invoiceitem1).to be_an_instance_of InvoiceItem
    end

    it "has item data" do
        expect(@invoiceitem1.id).to eq(1)
        expect(@invoiceitem1.item_id).to eq("263519844")
        expect(@invoiceitem1.invoice_id).to eq("1")
        expect(@invoiceitem1.unit_price).to eq(13635)
        expect(@invoiceitem1.quantity).to eq(5)
        expect(@invoiceitem1.created_at).to eq(Date.today - 1)
        expect(@invoiceitem1.updated_at).to eq(Date.today)
    end

     it "#unit_price_to_dollars" do
        expect(@invoiceitem1.unit_price_to_dollars).to eq(136.35)
    end
end
