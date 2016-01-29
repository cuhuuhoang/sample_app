class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @micropost = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
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
