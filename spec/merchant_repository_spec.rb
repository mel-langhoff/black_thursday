require "./spec/spec_helper"

RSpec.describe MerchantRepository do
    before :each do
        @merchant1 = Merchant.new({:id => 5, :name => "Turing School"})
        @merchant2 = Merchant.new({:id => 4, :name => "King Sooper's"})
        @merchantrepository = MerchantRepository.new("./data/merchants.csv")
    end

    it "exists" do
        expect(@merchantrepository).to be_an_instance_of MerchantRepository
    end

    it "has merchants" do
        expect(@merchantrepository.merchants).to be_a Array
        expect(@merchantrepository.merchants.map(&:id)).to include(12334105) # map(&:id) is used to create an array containing all the id values from the merchants array
        expect(@merchantrepository.merchants.map(&:name)).to include("Shopin1901")
    end

    xit "#all" do
        expect(@merchantrepository).to include({})
    end

    xit "#find_by_id" do
        expect(@merchantrepository).to be eq()
    end

    xit "#find_by_name" do
        expect(@merchantrepository).to be eq()
    end

    xit "#find_all_by_name" do
        expect(@merchantrepository).to be eq([])
    end

    xit "#create" do
        expect().to eq()
    end

    xit "#update" do
        expect().to eq()
    end

    xit "#delete" do
        expect().to eq()
    end

end