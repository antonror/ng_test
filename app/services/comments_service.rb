class CommentsService
  def self.movie_comments(movie_id)
    Comment.where(movie_id: movie_id)
           .joins(:user)
           .select(
             :id, :content, :movie_id, :user_id, :created_at,
             'users.name as user_name'
           )
  end

  def self.top_commenters
    User.joins(:comments)
        .where('comments.created_at >= ?', 7.days.ago.beginning_of_day)
        .group('comments.user_id')
        .order('COUNT(comments.user_id) DESC')
        .limit(10)
        .select(:id, :name, 'COUNT(comments.user_id) as comments_count')
  end
end
