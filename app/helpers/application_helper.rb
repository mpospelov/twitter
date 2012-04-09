module ApplicationHelper
  def log
    if current_user==nil
      link_to "Log IN", login_path
    else
      link_to "Log OUT", logout_path
    end

  end
end
