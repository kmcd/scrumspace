# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def set_focus(id)
    javascript_tag("$('#{id}').focus()");
  end
end
