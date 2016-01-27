class ExampleMailer < ApplicationMailer
  default from:"noreply@mailgun.com"

  def sample_email(user)
    @user = user
    mail(to: @user.email, subject: 'Sample Email')
  end
end
