class CommentDecorator < Draper::Decorator
  delegate_all

  def pretty_created_at
    object.created_at.strftime("%d.%m.%Y at %H:%M")
  end
end
