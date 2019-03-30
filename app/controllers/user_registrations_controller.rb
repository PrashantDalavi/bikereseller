class UserRegistrationsController < Devise::RegistrationsController
	def welcome
		super
        if @user.persisted?
            @email = params[:email]
			UserMailer.signup_form(@email).deliver_now
		end
    end


    private
    def sign_up_params
        params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end
    
    def account_update_params
        params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password)
    end
end