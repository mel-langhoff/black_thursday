require "./spec/spec_helper.rb"

RSpec.describe SalesEngine do
    before :each do
        @sales_engine = SalesEngine.new
        @sales_analyst = @sales_engine.analyst
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
        expect(se.items).to be_an_instance_of ItemRepository
        expect(se.merchants).to be_an_instance_of MerchantRepository
    end

    it "#analyst" do
        expect(@sales_analyst).to be_an_instance_of SalesAnalyst
    end
end