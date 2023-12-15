require "./spec/spec_helper"

RSpec.describe Invoice do
    before :each do
        @invoice1 = Invoice.new
    end

    it "exists" do
        expect(@invoice1).to be_an_instance_of Invoice
    end

end