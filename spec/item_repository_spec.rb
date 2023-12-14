require "./spec/spec_helper"

RSpec.describe ItemRepository do
    before :each do
        @itemrepository = ItemRepository.new("./data/items.csv")
    end

    it "exists" do
        expect(@itemrepository).to be_an_instance_of ItemRepository
    end

    it "has items and item information" do
        expect(@itemrepository.items).to be_a Array
        expect(@itemrepository.items.map(&:id)).to include(263395237) # map(&:id) is used to create an array containing all the id values from the merchants array
        expect(@itemrepository.items.map(&:name)).to include("510+ RealPush Icon Set")
    end

    it "#all" do
        expect(@itemrepository.items.first).to be_an_instance_of Item
    end

    it "#find_by_id" do
        expect(@itemrepository.find_by_id(263395237)).to be_an_instance_of Item
    end

    it "#find_by_name" do
        expect(@itemrepository.find_by_name("510+ RealPush Icon Set")).to be_an_instance_of Item
    end

    xit "#find_all_by_name" do
        expect(@itemrepository.find_all_by_name("RealPush")).to be_an_instance_of Item
    end

    it "#find_all_by_description" do
        @itemrepository.find_all_by_description("100% vector")
        expect(@itemrepository.items.first.name).to include("510")
        expect(@itemrepository.items.first.id).to eq(263395237)
    end

    it "#find_all_by_price" do
        @itemrepository.find_all_by_price(1300)
        expect(@itemrepository.items.first.description).to include("100% vector shapes (AI, CDR, SVG)")
    end

    xit "#find_all_by_merchant_id" do
        expect(@itemrepository.find_all_by_merchant_id(12334185)).to include("100% vector shapes (AI, CDR, SVG)")
    end

    it "#create" do
        expect(@itemrepository.items.first).to be_an_instance_of Item
        expect(@itemrepository.items.first.id).to eq(263395237)
    end

    it "#update" do
        original_attribute = { name: "Name" }
        item1 = @itemrepository.create(original_attribute)
    
        updated_attribute = { name: "New Name" }
        updated_item = @itemrepository.update(item1.id, updated_attribute)
    
        expect(updated_item.name).to eq("New Name")
        expect(updated_item).to be_an_instance_of(Item)
    end

    it "#delete" do
        attributes = { id: 263395237, name: "ToDelete" }
        @itemrepository.create(attributes)

        expect(@itemrepository.find_by_id(263395237)).to be_an_instance_of Item

        @itemrepository.delete(263395237)

        expect(@itemrepository.find_by_id(263395237)).to be_nil
    end

end