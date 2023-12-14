require "./spec/spec_helper.rb"

RSpec.describe SalesEngine do
    before :each do
        @sales_engine = SalesEngine.new
    end

    it "exists" do
        expect(@sales_engine).to be_an_instance_of SalesEngine
    end

    it "#from_csv" do
        se = SalesEngine.from_csv({
        :items     => "./data/items.csv",
        :merchants => "./data/merchants.csv",
        })
        expect(se).to be_an_instance_of SalesEngine
        expect(se.items).to be_a Array
        expect(se.items.first).to be_an_instance_of Item
        expect(se.merchants).to be_a Array
        expect(se.merchants.first).to be_an_instance_of Merchant
    end

end