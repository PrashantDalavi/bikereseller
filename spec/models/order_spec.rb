require 'rails_helper'

describe Order do
    context "when the User orders the product" do
    let(:product){Product.create!(name: "race bike", color: "black", price: 150, description: "awe")}
    let(:user){User.create!(email: "admin@admin.com", password: "123456")}

    it "is valid order with user and product" do
        expect(Order.new(user: user, product: product, total: 10)).to be_valid
    end

    it "is not valid order without user" do
        expect(Order.new(product: product, total: 10)).not_to be_valid
    end

    it "is not valid order without product" do
        expect(Order.new(user: user, total: 10)).not_to be_valid
    end

    end

end