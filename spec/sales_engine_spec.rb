require "./spec/spec_helper.rb"

RSpec.describe SalesEngine do
    before :each do
        sales_engine = SalesEngine.new
    end

    it "exists" do
        expect(sales_engine).to be_an_instance_of SalesEngine
end