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

    it "#find_by_id" do
        expect(@invoicerepository.find_by_id(1)).to be_an_instance_of Invoice
    end

    it "#find_all_by_customer_id" do
        customers_by_id = @invoicerepository.find_all_by_customer_id(1)
        expect(customers_by_id).to be_a Array
        expect(customers_by_id.first).to be_an_instance_of Invoice
        expect(customers_by_id.first.status).to eq("pending")
    end
end