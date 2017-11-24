module ApplicationHelper
  def resource_name
    :emailinglist
  end

  def resource
      @resource ||= Emailinglist.new
  end

  def resource_class
      Emailinglist
  end
end
