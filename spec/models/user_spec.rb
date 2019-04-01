require 'rails_helper'

describe User do
    context "when the user has valid email and password" do
        let(:user){User.create!(email: "admin@admin.com", password: "123456")}

        it "is valid user with email and password"do
        expect(User.new(email: "admin@admin.com", password: "123456")).to be_valid
        end

        it "is not valid user without email"do
        expect(User.new(email: "", password: "123456")).not_to be_valid
        end

        it "is not valid user without password"do
        expect(User.new(email: "admin@admin.com", password: "")).not_to be_valid
        end

    end

end