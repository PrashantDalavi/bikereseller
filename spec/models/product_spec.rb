require 'rails_helper'

describe Product do
    context "when the product has comments" do
        let(:product){Product.create!(name: "race bike", color: "black", price: 150, description: "awe")}
        let(:user){User.create!(email: "admin@gmail.com", password: "123456")}
        before do 
            product.comments.create!(rating:1, user: user, body: "awful bike")
            product.comments.create!(rating:3, user: user, body: "hmmmm bike")
            product.comments.create!(rating:5, user: user, body: "great bike")
        end

        it "returns the average rating of all comments" do
            expect(product.average_rating).to eq 3
        end

        it"is valid with all the field" do
            expect(Product.new(name: "race bike", color: "black", price: 150, description: "awe")).to be_valid
        end

        it"is not valid without name" do
            expect(Product.new(color: "black", price: 150, description: "awe")).not_to be_valid
        end

        it"is not valid without color" do
            expect(Product.new(name: "race bike", price: 150, description: "awe")).not_to be_valid
        end

        it"is not valid without price" do
            expect(Product.new(name: "race bike", color: "black", description: "awe")).not_to be_valid
        end

        it"is not valid without description" do
            expect(Product.new(name: "race bike", price: 150, color: "black")).not_to be_valid
        end
    end    
end