require "./spec/spec_helper"

RSpec.describe InvoiceItem do
    before :each do
        @invoiceitem = InvoiceItem.new({
          :id => 1,
          :item_id => 263519844,
          :invoice_id => 1,
          :quantity => 5,
          :unit_price => BigDecimal(13635, 4),
          :created_at => Date.today - 1,
          :updated_at => Date.today
        })
    end

    it "exists" do
        expect(@invoiceitem).to be_an_instance_of InvoiceItem
    end

    it "#unit_price_to_dollars" do
        expect(@invoiceitem.unit_price_to_dollars).to eq(136.35)
    end
end