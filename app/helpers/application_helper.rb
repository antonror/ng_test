module ApplicationHelper
  def human_attr(class_symbol, attr_name)
    class_symbol.capitalize.to_s.constantize.human_attribute_name(attr_name)
  end
end
