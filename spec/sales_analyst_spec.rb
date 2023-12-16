require "./spec/spec_helper"

RSpec.describe SalesAnalyst do
    before :each do
        repositories = SalesEngine.from_csv({
            :items     => "./data/items.csv",
            :merchants => "./data/merchants.csv",
            :invoices => "./data/invoices.csv",
            :transactions => "./data/transactions.csv",
            :customers => "./data/customers.csv"
            })

        @sales_analyst = SalesAnalyst.new
        @sales_analyst.items = repositories.items
        @sales_analyst.invoices = repositories.invoices
        @sales_analyst.merchants = repositories.merchants
        @sales_analyst.invoices = repositories.invoices
        @sales_analyst.customers = repositories.customers
        @sales_analyst.transactions = repositories.transactions
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

    it "#average_item_price_per_merchant" do
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

    it "#top_merchants_by_invoice_count" do
        expect(@sales_analyst.top_merchants_by_invoice_count).to be_a Array
        expect(@sales_analyst.top_merchants_by_invoice_count.first).to be_an_instance_of Merchant
    end

    it "#bottom_merchants_by_invoice_count" do
        expect(@sales_analyst.bottom_merchants_by_invoice_count).to be_a Array
        expect(@sales_analyst.bottom_merchants_by_invoice_count.first).to be_an_instance_of Merchant
    end

    it "#top_days_by_invoice_count" do
        expect(@sales_analyst.top_days_by_invoice_count).to be_a Array
        expect(@sales_analyst.top_days_by_invoice_count.first). to be_a String
    end

    it "#invoice_status" do
        expect(@sales_analyst.invoice_status("pending")).to be_a Float
        expect(@sales_analyst.invoice_status("pending")).to eq(29.55)
        expect(@sales_analyst.invoice_status("shipped")).to eq(56.95)
        expect(@sales_analyst.invoice_status("returned")).to eq(13.5)
    end 

    

end