module ApplicationHelper
  def include_user_id?(collection, user_id)
    collection.map(&:user_id).include?(user_id)
  end

  def human_attr(class_symbol, attr_name)
    class_symbol.capitalize.to_s.constantize.human_attribute_name(attr_name)
  end
end
