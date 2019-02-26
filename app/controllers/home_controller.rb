class HomeController < ApplicationController
  expose :commenters_top, -> { CommentsService.top_commenters }

  def welcome; end

  def top_commenters; end
end
