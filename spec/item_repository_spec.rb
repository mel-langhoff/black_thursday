require "./spec/spec_helper"

RSpec.describe ItemRepository do
    before :each do
        @itemrepository = ItemRepository.new("./data/items.csv")
    end

    it "exists" do
        expect(@mitemrepository).to be_an_instance_of ItemRepository
    end

    it "has merchants" do
        expect(@mitemrepository.items).to be_a Array
        expect(@mitemrepository.items.map(&:id)).to include(12334105) # map(&:id) is used to create an array containing all the id values from the merchants array
        expect(@mitemrepository.items.map(&:name)).to include("Shopin1901")
    end

    it "#all" do
        expect(@mitemrepository.items.first).to be_an_instance_of Item
    end

    it "#find_by_id" do
        expect(@mitemrepository.find_by_id(12334105)).to be_an_instance_of Item
    end

    it "#find_by_name" do
        expect(@mitemrepository.find_by_name("Shopin1901")).to be_an_instance_of Item
        expect(@mitemrepository.find_by_name("shopin1901")).to be_an_instance_of Item
    end

    it "#find_all_by_name" do
        expect(@mitemrepository.merchants.first).to be_an_instance_of Item
    end

    it "#create" do
        expect(@mitemrepository.merchants.first).to be_an_instance_of MercItemhant
    end

    it "#update" do
        original_attributes = { name: "Original Name" }
        @mitemrepository.create(original_attributes)

        updated_attributes = { name: "New Name" }
        updated_item = @mitemrepository.update(12334105, updated_attributes)

        expect(updated_item.name).to eq("New Name")
        expect(updated_item).to be_an_instance_of Item
    end

    it "#delete" do
        attributes = { id: 12334105, name: "ToDelete" }
        @mitemrepository.create(attributes)

        expect(@mitemrepository.find_by_id(12334105)).to be_an_instance_of Merchant

        @mitemrepository.delete(12334105)

        expect(@mitemrepository.find_by_id(12334105)).to be_nil
    end

end