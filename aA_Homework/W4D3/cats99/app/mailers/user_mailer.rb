class UserMailer < ApplicationMailer
  default form: 'from@example.com'

  def welcome_email(user)
    @user = user
    @url = 'http://example.com.login'
    mail(to: necromancer1234@hotmail.com, subject: "Test of tests")
  end
end
