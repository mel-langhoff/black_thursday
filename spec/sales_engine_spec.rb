require "./spec/spec_helper.rb"

RSpec.describe SalesEngine do
    before :each do
        @sales_engine = SalesEngine.from_csv({
            :items     => "./data/items.csv",
            :merchants => "./data/merchants.csv",
            :invoices => "./data/invoices.csv"
            })
        @sales_analyst = @sales_engine.analyst
    end

    it "exists" do
        expect(@sales_engine).to be_an_instance_of SalesEngine
    end

    it "#from_csv" do
        expect(@sales_engine).to be_an_instance_of SalesEngine
        expect(@sales_engine.items).to be_an_instance_of ItemRepository
        expect(@sales_engine.merchants).to be_an_instance_of MerchantRepository
        expect(@sales_engine.invoices).to be_an_instance_of InvoiceRepository
    end

    it "#analyst" do
        expect(@sales_analyst).to be_an_instance_of SalesAnalyst
    end

    xit "can return analysis with #analyst" do
        expect(@sales_analyst.average_invoices_per_merchant).to eq(10.49)
        expect(@sales_analyst.average_invoices_per_merchant_standard_deviation).to eq(3.29)
    end

end
