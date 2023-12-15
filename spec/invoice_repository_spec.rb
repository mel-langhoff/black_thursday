require "./spec/spec_helper"

RSpec.describe InvoiceRepository do
    before :each do
        @invoicerepository = InvoiceRepository.new("./data/invoices.csv")
    end

    it "exists" do
        expect(@invoicerepository).to be_an_instance_of InvoiceRepository
    end

    it "#load_invoice" do
        loaded_invoices_from_csv_file = @invoicerepository
        expect(@invoicerepository.invoices.first.customer_id).to eq(1)
    end

    it "#all" do
        expect(@invoicerepository.all).to include Invoice
    end 
end