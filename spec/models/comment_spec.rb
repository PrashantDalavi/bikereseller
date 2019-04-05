require 'rails_helper'

describe Product do
    context "when the product has comments" do
        let(:product){Product.create!(name: "race bike", color: "black", price: 150, description: "awe")}
        let(:user){User.create!(email: "admin@gmail.com", password: "123456")}
        before do 
            product.comments.create!(rating:1, user: user, body: "awful bike")
        end

        it "is valid comment with user, body and rating" do
            expect(Comment.new(user: user, body: "awe", product: product, rating: 1)).to be_valid        
        end

        it "is not valid comment without user" do
            expect(Comment.new(body: "awe", product: product, rating: 1)).not_to be_valid        
        end

        it "is not valid comment without body" do
            expect(Comment.new(user: user, product: product, rating: 1)).not_to be_valid        
        end

        it "is not valid comment without rating" do
            expect(Comment.new(user: user, body: "awe", product: product)).not_to be_valid        
        end

        it "is not valid comment without product" do
            expect(Comment.new(user: user, body: "awe", rating: 1)).not_to be_valid        
        end
    end
end