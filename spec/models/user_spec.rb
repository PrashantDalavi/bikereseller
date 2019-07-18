require 'rails_helper'

describe User do
    context "when the user has valid email and password" do
        @user = FactoryBot.build(:user)

        it "is valid user with email and password"do
        @user = FactoryBot.build(:user)
        expect(@user).to be_valid
        end

        it "is not valid user without email"do
        @user = FactoryBot.build(:user, email: "not_an_email")
        expect(@user).not_to be_valid
        end

        it "is not valid user without password"do
        @user = FactoryBot.build(:user, password: " ")
        expect(@user).not_to be_valid
        end

    end

end