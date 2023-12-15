require "./spec/spec_helper"

RSpec.describe InvoiceRepository do
    before :each do
        @invoicerepository = InvoiceRepository.new
    end

    it "exists" do
        expect(@invoicerepository).to be_an_instance_of InvoiceRepository
    end

end