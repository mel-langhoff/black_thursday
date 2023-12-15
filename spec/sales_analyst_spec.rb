require "./spec/spec_helper"

RSpec.describe SalesAnalyst do
    before :each do
        items_and_merchants_and_invoices_repositories = SalesEngine.from_csv({
        :items     => "./data/items.csv",
        :merchants => "./data/merchants.csv",
        :invoices => "./data/invoices.csv"
        })

        @sales_analyst = SalesAnalyst.new
        @sales_analyst.items = items_and_merchants_and_invoices_repositories.items
        @sales_analyst.invoices = items_and_merchants_and_invoices_repositories.invoices
        @sales_analyst.merchants = items_and_merchants_and_invoices_repositories.merchants
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

    it "#average_items_price_per_merchant" do
        expect(@sales_analyst.average_item_price_per_merchant(12334159)).to be_a BigDecimal
    end 

    it "#average_average_price_per_merchant" do
        expect(@sales_analyst.average_average_price_per_merchant).to be_a BigDecimal
    end

    it "#golden_items" do
        expect(@sales_analyst.golden_items).to be_a Array
    end

    it "#average_invoices_per_merchant" do
        expect(@sales_analyst.average_invoices_per_merchant).to eq(10.49)
    end

    it "#average_invoices_per_merchant_standard_deviation" do
        expect(@sales_analyst.average_invoices_per_merchant_standard_deviation).to eq(3.29)
    end

end