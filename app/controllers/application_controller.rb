class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :in_future

  def admin_required
    if !current_user.admin?
      redirect_to news_index_path
    end
  end

  def in_future(date)
    if date.year < Time.now.year
      return false
    elsif date.month < Time.now.month
      return false
    elsif date.day < Time.now.day
      return false
    else
      return true
    end
  end

end
