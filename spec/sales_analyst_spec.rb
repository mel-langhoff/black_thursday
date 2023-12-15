require "./spec/spec_helper"

RSpec.describe SalesAnalyst do
    before :each do
        items_and_merchants_repositories = SalesEngine.from_csv({
        :items     => "./data/items.csv",
        :merchants => "./data/merchants.csv",
        })

        @sales_analyst = SalesAnalyst.new
        @sales_analyst.items = items_and_merchants_repositories.items
        @sales_analyst.merchants = items_and_merchants_repositories.merchants
    end

    it "exists" do
        expect(@sales_analyst).to be_an_instance_of SalesAnalyst
    end

    it "#average_items_per_merchant" do
        expect(@sales_analyst.average_items_per_merchant).to eq(2.88)
    end

    it "#average_items_per_merchant_standard_deviation" do
        expect(@sales_analyst.average_items_per_merchant_standard_deviation).to eq(3.26)
    end

end