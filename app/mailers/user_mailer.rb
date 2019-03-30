class UserMailer < ApplicationMailer
    default from: "admin@bikeseller.com"

    def contact_form(email, name, message)
    @message = message
      mail(from: email,
           to: 'p.d.dalavi@gmail.com',  
           subject: "A new contact form message from #{name}")
      mail(to: email,  
          subject: "Thank you for Contacting Us")
    end

    def welcome(user)
      @appname = "Bike Shop"
      mail(to: user.email,
           subject: "Welcome to #{@appname}!")
    end
end
