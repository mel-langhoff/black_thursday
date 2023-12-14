require "./spec/spec_helper"

RSpec.describe Item do
    before :each do
        @item1 = Item.new({:id => 1, :name => "Candle", :description => "Vanilla", :unit_price => 10, :created_at => Date.today - 1, :updated_at => Date.today, :merchant_id => 1})
    end

    it "exists" do
        expect(@item1).to be_an_instance_of Item
    end

    it "has item data" do
        expect(@item1.id).to eq(1)
        expect(@item1.name).to eq("Candle")
        expect(@item1.description).to eq("Vanilla")
        expect(@item1.unit_price).to eq(10)
        expect(@item1.merchant_id).to eq(1)
        # expect(@item1.created_at).to eq(Date.today - 1)
        # expect(@item1.updated_at).to eq(Date.today)
    end

end