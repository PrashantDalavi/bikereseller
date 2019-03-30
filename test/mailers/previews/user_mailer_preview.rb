class UserMailerPreview < ActionMailer::Preview
    def create
        UserMailer.welcome("john@example.com", "John", "Hello World!")
    end

end