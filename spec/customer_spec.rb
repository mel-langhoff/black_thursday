require "./spec/spec_helper"

RSpec.describe Customer do
    before :each do
        @customer = Customer.new({
            :id => 1,
            :first_name => "Joey",
            :last_name => "Clarke",
            :created_at => Date.today - 1,
            :updated_at => Date.today
          })
    end

    it "exists" do
        expect(@customer).to be_an_instance_of Customer
    end

    it "has attributes" do
        expect(@customer.first_name).to eq("Joey")
        expect(@customer.id).to eq(1)
    end

end