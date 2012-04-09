module ApplicationHelper
  def log
    if session[:user_id]==nil
      link_to "Log in", login_path
    else
      link_to "Log out", logout_path
    end
  end

  def home
    if session[:user_id]==nil
      link_to "Home", new_user_path
    else
      link_to "Home", user_path(current_user)
    end

  end

  def edit
    if session[:user_id]
      link_to 'Edit', edit_user_path(current_user)
    end
  end
end
