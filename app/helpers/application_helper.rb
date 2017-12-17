module ApplicationHelper
  def new_email_name
    :emailinglist
  end

  def new_email
      @resource ||= Emailinglist.new
  end

  def resource_class
      Emailinglist
  end
end
