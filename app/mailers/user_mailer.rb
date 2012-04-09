class UserMailer < ActionMailer::Base
  def registration_confirmation(user)
    @user = user
    attachments["rails.png"] = File.read("#{Rails.root}/app/assets/images/rails.png")
    mail(:to => user.email, :subject => "Registered", :from => "mixan946@gmail.com")
  end

  def updating_confirmation(user)
    @user = user
    attachments["rails.png"] = File.read("#{Rails.root}/app/assets/images/rails.png")
    mail(:to => user.email, :subject => "Registered", :from => "mixan946@gmail.com")
  end
end
