require "./spec/spec_helper"

RSpec.describe InvoiceItemRepository do
    before :each do
        @invoiceitemrepository = InvoiceItemRepository.new("./data/invoice_items.csv")
        @invoiceitem = InvoiceItem.new({:id => 1, :item_id => 263519844, :invoice_id => 1, :quantity => 5, :unit_price => 13635, :created_at => Date.today - 1, :updated_at => Date.today})
    end

    it "exists" do
        expect(@invoiceitemrepository).to be_an_instance_of InvoiceItemRepository
        expect(@invoiceitemrepository.invoice_items).to be_a Array
    end

    it "#all" do
        expect(@invoiceitemrepository.all).to be_a Array
        expect(@invoiceitemrepository.invoice_items.first.item_id).to eq("263519844")
    end

    it "#find_by_id" do
        expect(@invoiceitemrepository.find_by_id(1)).to be_an_instance_of InvoiceItem
        expect(@invoiceitemrepository.find_by_id(1).item_id).to eq("263519844")
    end

    it "#find_all_by_item_id" do
        items_by_id = @invoiceitemrepository.find_all_by_item_id(263519844)
        expect(items_by_id).to be_a Array
        expect(items_by_id.first).to be_an_instance_of InvoiceItem
        expect(items_by_id.first.unit_price).to eq("13635")
    end

    it "#find_all_by_invoice_id" do
        all_invoice_ids = @invoiceitemrepository.find_all_by_invoice_id(1)
        expect(all_invoice_ids).to be_a Array
        expect(all_invoice_ids.first).to be_an_instance_of InvoiceItem
        expect(all_invoice_ids.first.unit_price).to eq("13635")
    end

    it "#create" do
        initial_count = @invoiceitemrepository.invoice_items.length
        invoice_item_attributes = ({:id => 1, :item_id => 263519844, :invoice_id => 1, :quantity => 5, :unit_price => 13635, :created_at => Date.today - 1, :updated_at => Date.today})
        new_invoice_item = @invoiceitemrepository.create(invoice_item_attributes)

        expect(new_invoice_item).to be_an_instance_of InvoiceItem
        expect(new_invoice_item.id).to eq(1)
        expect(new_invoice_item.unit_price).to eq(13635)
        expect(@invoiceitemrepository.invoice_items.length).to eq(initial_count + 1)
    end

    it "#update" do
        original_quantity = { id: 1, quantity: "5" }
        @invoiceitemrepository.create(original_quantity)

        updated_quantity = { id: 1, quantity: "6" }
        updated_invoice_item = @invoiceitemrepository.update(1, updated_quantity)

        expect(updated_invoice_item.quantity).to eq("6")
        expect(updated_invoice_item).to be_an_instance_of InvoiceItem
    end

    it "#delete" do
        attributes = { id: 1, item_id: "263519844" }
        @invoiceitemrepository.create(attributes)

        expect(@invoiceitemrepository.find_by_id(1)).to be_an_instance_of InvoiceItem

        @invoiceitemrepository.delete(1)

        expect(@invoiceitemrepository.find_by_id(1)).to be_nil
    end

end
