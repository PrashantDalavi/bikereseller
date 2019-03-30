class UserMailerPreview < ActionMailer::Preview
    def welcome
        UserMailer.signup_form("john@example.com")
    end

end