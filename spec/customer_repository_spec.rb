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

    it "#create" do
        initial_count = @customerrepository.customers.length
        customer_attributes = ({
            :id => 1,
            :first_name => "Joey",
            :last_name => "Clarke",
            :created_at => Date.today - 1,
            :updated_at => Date.today
          })
        new_customer = @customerrepository.create(customer_attributes)

        expect(new_customer).to be_an_instance_of Customer
        expect(new_customer.id).to eq(1)
        expect(new_customer.first_name).to eq("Joey")
        expect(@customerrepository.customers.length).to eq(initial_count + 1)
    end

    it "#update" do
        original_attribute = { id: 1, first_name: "Joey" }
        customer = @customerrepository.create(original_attribute)
    
        updated_attribute = { first_name: "New Name" }
        updated_customer = @customerrepository.update(customer.id, updated_attribute)
    
        expect(updated_customer.first_name).to eq("New Name")
        expect(updated_customer).to be_an_instance_of Customer
    end

    xit "#delete" do
        attributes = { id: 263395237, name: "ToDelete" }
        @customerrepository.create(attributes)

        expect(@customerrepository.find_by_id(263395237)).to be_an_instance_of Item

        @customerrepository.delete(263395237)

        expect(@customerrepository.find_by_id(263395237)).to be_nil
    end

end