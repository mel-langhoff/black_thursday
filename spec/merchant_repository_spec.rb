require "./spec/spec_helper"

RSpec.describe MerchantRepository do
    before :each do
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

    it "#all" do
        expect(@merchantrepository.all).to be_a Array
        expect(@merchantrepository.merchants.first).to be_an_instance_of Merchant
    end

    it "#find_by_id" do
        expect(@merchantrepository.find_by_id(12334105)).to be_an_instance_of Merchant
    end

    it "#find_by_name" do
        expect(@merchantrepository.find_by_name("Shopin1901")).to be_an_instance_of Merchant
    end

    it "#find_all_by_name" do
        expect(@merchantrepository.find_all_by_name("Shopin1901").first.id).to eq(12334105)
    end

    it "#create" do
        initial_count = @merchantrepository.merchants.length
        merchant_attributes = ({:id => 5, :name => "Turing School"})
        new_merchant = @merchantrepository.create(merchant_attributes)

        expect(new_merchant).to be_an_instance_of Merchant
        expect(new_merchant.id).to eq(5)
        expect(new_merchant.name).to eq("Turing School")
        expect(@merchantrepository.merchants.length).to eq(initial_count + 1)    
    end

    it "#update" do
        original_attributes = { name: "Original Name" }
        @merchantrepository.create(original_attributes)

        updated_attributes = { name: "New Name" }
        updated_merchant = @merchantrepository.update(12334105, updated_attributes)

        expect(updated_merchant.name).to eq("New Name")
        expect(updated_merchant).to be_an_instance_of(Merchant)
    end

    it "#delete" do
        attributes = { id: 12334105, name: "ToDelete" }
        @merchantrepository.create(attributes)

        expect(@merchantrepository.find_by_id(12334105)).to be_an_instance_of Merchant

        @merchantrepository.delete(12334105)

        expect(@merchantrepository.find_by_id(12334105)).to be_nil
    end

end