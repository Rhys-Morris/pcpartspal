class UserMailer < ApplicationMailer
    default from: 'notifications@pcpartspal.herokuapp.com'

    def welcome
        @user = params[:user]
        @url = 'https://pcpartspal.herokuapp.com/'
        mail(to: @user.email, subject: "Welcome to PcPartsPal")
    end

    def purchase_confirmation
        @user = params[:user]
        @purchase = params[:purchase]
        mail(to: @user.email, subject: "Congratulations on your purchase!")
    end
end
