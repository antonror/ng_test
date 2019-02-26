class MoviesController < ApplicationController
  before_action :authenticate_user!, only: [:send_info, :export]

  expose_decorated(:movies) { Movie.all.includes(:genre) }
  expose_decorated(:movie)
  expose :comment, -> { Comment.new }
  expose_decorated :comments, -> { CommentsService.movie_comments(params[:id])}

  def send_info
    MovieInfoMailer.send_info(current_user, movie).deliver_later
    redirect_back(fallback_location: root_path,
                  notice: "Email sent with movie info")
  end

  def export
    MovieCsvExporterJob.perform_later(current_user.id)
    redirect_back(fallback_location: root_path,
                  notice: "Movies exported")
  end
end
