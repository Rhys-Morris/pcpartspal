class UserMailer < ApplicationMailer
    default from: 'notificatons@pcpartspal.herokuapp.com'

    def welcome
        @user = params[:user]
        @url = 'https://pcpartspal.herokuapp.com/'
        mail(to: @user.email, subject: "Welcome to PcPartsPal")
    end
end
