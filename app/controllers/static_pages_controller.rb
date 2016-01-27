class StaticPagesController < ApplicationController
  def home
  end

  def help

  end

  def sendmail
    #User.first.send_activation_email
    ExampleMailer.sample_email(User.first).deliver

  end

  def about
  end

  def contact
  end
end
