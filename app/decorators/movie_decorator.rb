class MovieDecorator < Draper::Decorator
  delegate_all

  def cover_url
    object.pair_guru_movie_details.try(:poster_url) ||
        h.image_url('blank.png')
  end

  def genre_name
    object.genre.try(:name)
  end

  def plot
    object.pair_guru_movie_details.try(:plot)
  end

  def released_at
    object.released_at.to_date.to_s
  end

  def rating
    object.pair_guru_movie_details.try(:rating)
  end
end
