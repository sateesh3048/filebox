module ApplicationHelper
  def active_class(controller, action = nil)
    puts params.inspect
    if controller && action
      params[:controller] == controller && params[:action] == action ? 'active' : ''
    elsif controller
      params[:controller] == controller ? 'active' : ''
    end
  end
end
