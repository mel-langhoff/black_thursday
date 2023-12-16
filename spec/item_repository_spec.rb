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
        expect(@itemrepository.all).to be_a Array
        expect(@itemrepository.items.first).to be_an_instance_of Item
        expect(@itemrepository.items.first.name).to include("510+ RealPush Icon Set")

    end

    it "#find_by_id" do
        expect(@itemrepository.find_by_id(263395237)).to be_an_instance_of Item
        expect(@itemrepository.find_by_id(24354554)).to be_nil
    end

    it "#find_by_name" do
        expect(@itemrepository.find_by_name("dfgsdhd")).to be_nil
        expect(@itemrepository.find_by_name("510+ RealPush Icon Set")).to be_an_instance_of Item
    end

    # it "#find_all_by_name" do
    #     all_by_name = @itemrepository.find_all_by_name("RealPush")
    #     expect(all_by_name.first.id).to eq(263395237)
    # end

    it "#find_all_by_description" do
        all_by_description = @itemrepository.find_all_by_description("100% vector")
        expect(all_by_description.first.name).to include("510")
        expect(all_by_description.first.id).to eq(263395237)
    end

    it "#find_all_by_price" do
        all_by_price = @itemrepository.find_all_by_price(1300)
        expect(all_by_price.first.description).to include("Glitter")
    end

    it "#find_all_by_merchant_id" do
        all_by_merchant_id = @itemrepository.find_all_by_merchant_id(12334185)
        expect(all_by_merchant_id.first.description).to include("scrabble")
    end

    it "#find_all_by_price_range" do
        item1 = Item.new(id: 1, name: "Glitter Item", unit_price: BigDecimal('1300.00'))
        item2 = Item.new(id: 2, name: "Another Item", unit_price: BigDecimal('1325.00'))
        item3 = Item.new(id: 3, name: "Disney Item", unit_price: BigDecimal('1350.00'))
        item4 = Item.new(id: 4, name: "Outside Range Item", unit_price: BigDecimal('1400.00'))
        @itemrepository.items = [item1, item2, item3, item4]
        all_by_price_range = @itemrepository.find_all_by_price_range(BigDecimal('1300.00')..BigDecimal('1350.00'))

        expect(all_by_price_range).to be_an(Array).or be_nil
        expect(all_by_price_range.first).to be_an_instance_of Item
        expect(all_by_price_range.map(&:unit_price)).to all(be_between(BigDecimal('1300.00'), BigDecimal('1350.00')))
        expect(all_by_price_range.first.name).to include("Glitter")
        expect(all_by_price_range.last.name).to include("Disney")
    end

    xit "#find_all_by_price_range" do
        all_by_price_range = @itemrepository.find_all_by_price_range(('1300.00')..('1350.00'))
        expect(all_by_price_range.first).to be_an_instance_of Item
        # expect(all_by_price_range.first.name).to include("Glitter")
        # expect(all_by_price_range.last.name).to include("Disney")
    end

    it "#create" do
        initial_count = @itemrepository.items.length
        item_attributes = ({:id => 1, :name => "Candle", :description => "Vanilla", :unit_price => BigDecimal(10.99,4), :created_at => Date.today - 1, :updated_at => Date.today, :merchant_id => 1})
        new_item = @itemrepository.create(item_attributes)

        expect(new_item).to be_an_instance_of Item
        expect(new_item.id).to eq(1)
        expect(new_item.name).to eq("Candle")
        expect(@itemrepository.items.length).to eq(initial_count + 1)
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