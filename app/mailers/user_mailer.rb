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

    def signup_form(email)      
      mail(from: "admin@bikeseller.com",
           to: email,
           subject: "Welcome to BikeShop!")
    end
end
