require "./spec/spec_helper"

RSpec.describe ItemRepository do
    before :each do
        @customerrepository = CustomerRepository.new("./data/customers.csv")
    end

    it "exists" do
        expect(@customerrepository).to be_an_instance_of CustomerRepository
    end

    it "has items and item information" do
        expect(@customerrepository.customers).to be_a Array
        expect(@customerrepository.customers.first.id).to eq(1) # map(&:id) is used to create an array containing all the id values from the merchants array
        expect(@customerrepository.customers.first.first_name).to eq("Joey")
    end

    it "#all" do
    puts @customerrepository.customers.first
        expect(@customerrepository.customers.first).to be_an_instance_of Customer
        expect(@customerrepository.customers.first.first_name).to eq("Joey")

    end

    it "#find_by_id" do
        expect(@customerrepository.find_by_id(1)).to be_an_instance_of Customer
        expect(@customerrepository.find_by_id(1).first_name).to eq("Joey")
    end

    it "#find_all_by_first_name" do
        customer = @customerrepository.find_all_by_first_name("Joey")
        expect(customer).to be_a Array
        expect(customer.first).to be_an_instance_of Customer
    end

    it "#find_all_by_last_namee" do
        all_by_last_name = @customerrepository.find_all_by_last_name("Ondricka")
        expect(all_by_last_name.first.first_name).to eq("Joey")
    end

    xit "#find_all_by_description" do
        all_by_description = @customerrepository.find_all_by_description("100% vector")
        expect(all_by_description.first.name).to include("510")
        expect(all_by_description.first.id).to eq(263395237)
    end

    xit "#find_all_by_price" do
        all_by_price = @customerrepository.find_all_by_price(1300)
        expect(all_by_price.first.description).to include("Glitter")
    end

    xit "#find_all_by_merchant_id" do
        all_by_merchant_id = @customerrepository.find_all_by_merchant_id(12334185)
        expect(all_by_merchant_id.first.description).to include("scrabble")
    end

    xit "#find_all_by_price_range" do
        item1 = Item.new(id: 1, name: "Glitter Item", unit_price: BigDecimal('1300.00'))
        item2 = Item.new(id: 2, name: "Another Item", unit_price: BigDecimal('1325.00'))
        item3 = Item.new(id: 3, name: "Disney Item", unit_price: BigDecimal('1350.00'))
        item4 = Item.new(id: 4, name: "Outside Range Item", unit_price: BigDecimal('1400.00'))
        @customerrepository.items = [item1, item2, item3, item4]
        all_by_price_range = @customerrepository.find_all_by_price_range(BigDecimal('1300.00')..BigDecimal('1350.00'))

        expect(all_by_price_range).to be_an(Array).or be_nil
        expect(all_by_price_range.first).to be_an_instance_of Item
        expect(all_by_price_range.map(&:unit_price)).to all(be_between(BigDecimal('1300.00'), BigDecimal('1350.00')))
        expect(all_by_price_range.first.name).to include("Glitter")
        expect(all_by_price_range.last.name).to include("Disney")
    end

    xit "#create" do
        expect(@customerrepository.items.first).to be_an_instance_of Item
        expect(@customerrepository.items.first.id).to eq(263395237)
    end

    xit "#update" do
        original_attribute = { name: "Name" }
        item1 = @customerrepository.create(original_attribute)
    
        updated_attribute = { name: "New Name" }
        updated_item = @customerrepository.update(item1.id, updated_attribute)
    
        expect(updated_item.name).to eq("New Name")
        expect(updated_item).to be_an_instance_of(Item)
    end

    xit "#delete" do
        attributes = { id: 263395237, name: "ToDelete" }
        @customerrepository.create(attributes)

        expect(@customerrepository.find_by_id(263395237)).to be_an_instance_of Item

        @customerrepository.delete(263395237)

        expect(@customerrepository.find_by_id(263395237)).to be_nil
    end

end