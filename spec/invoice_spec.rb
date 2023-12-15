require "./spec/spec_helper"

RSpec.describe Invoice do
    before :each do
        @invoice1 = Invoice.new({:id => 1, :customer_id => 1, :merchant_id => 12335938, :status => "pending", :created_at => Date.today - 1, :updated_at => Date.today})
    end

    it "exists" do
        expect(@invoice1).to be_an_instance_of Invoice
    end

    it "has attributes" do
        expect(@invoice1.id).to eq(1)
        expect(@invoice1.customer_id).to eq(1)
        expect(@invoice1.merchant_id).to eq(12335938)
    end

end