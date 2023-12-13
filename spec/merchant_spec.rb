require "./spec/spec_helper"

RSpec.describe Merchant do
    before :each do
        @merchant1 = Merchant.new({:id => 5, :name => "Turing School"})
    end

    it "exists" do
        expect(@merchant1).to be_an_instance_of Merchant
    end

    it "has date information" do
        expect(@merchant1.created_at).to eq(Date.today - 1)
        expect(@merchant1.updated_at).to eq(Date.today)
    end

end