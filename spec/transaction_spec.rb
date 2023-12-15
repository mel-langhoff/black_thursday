require "./spec/spec_helper"

RSpec.describe Transaction do
    before :each do
        @transaction = Transaction.new({
            :id => 6,
            :invoice_id => 8,
            :credit_card_number => "4242424242424242",
            :credit_card_expiration_date => "0220",
            :result => "success",
            :created_at => Date.today - 1,
            :updated_at => Date.today
          })
    end

    it "exists" do
        expect(@transaction).to be_an_instance_of Transaction
    end

    it "has attributes" do
        expect(@transaction.id).to eq(6)
        expect(@transaction.invoice_id).to eq(8)
        expect(@transaction.credit_card_number).to eq("4242424242424242")
        expect(@transaction.credit_card_expiration_date).to eq("0220")
        expect(@transaction.result).to eq("success")
        expect(@transaction.created_at).to eq(Date.today - 1)
        expect(@transaction.updated_at).to eq(Date.today)
    end


end