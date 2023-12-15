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

    it "#find_all_by_merchant_id" do
        merchants_by_id = @invoicerepository.find_all_by_merchant_id(12335938)
        expect(merchants_by_id).to be_a Array
        expect(merchants_by_id.first).to be_an_instance_of Invoice
        expect(merchants_by_id.first.status).to eq("pending")
    end

    it "#find_all_by_merchant_id" do
        all_statuses = @invoicerepository.find_all_by_status("pending")
        expect(all_statuses).to be_a Array
        expect(all_statuses.first).to be_an_instance_of Invoice
        expect(all_statuses.first.merchant_id).to eq(12335938)
    end

    it "#create" do
        initial_count = @invoicerepository.invoices.length
        invoice_attributes = ({:id => 1, :customer_id => 1, :merchant_id => 12335938, :status => "pending", :created_at => Date.today - 1, :updated_at => Date.today})
        new_invoice = @invoicerepository.create(invoice_attributes)

        expect(new_invoice).to be_an_instance_of Invoice
        expect(new_invoice.id).to eq(1)
        expect(new_invoice.merchant_id).to eq(12335938)
        expect(@invoicerepository.invoices.length).to eq(initial_count + 1)
    end

end