class CommentsService
  def self.movie_comments(movie_id)
    Comment.where(movie_id: movie_id)
           .joins(:user)
           .select(
             :id, :content, :movie_id, :user_id, :created_at,
             'users.name as user_name'
           )
  end
end
