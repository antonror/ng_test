module PairGuruMovieApi
  class Movie < Base
    property :id, type: :integer
    property :type, type: :string
    property :title, type: :string
    property :plot, type: :string
    property :rating, type: :float
    property :poster, type: :string # is in form of absolute path

    def poster_url
      if self.poster.present? && # and is compliant with url regexp
          (url = "https://#{PairGuruMovieApi.hostname}#{self.poster}").
              match(URI::regexp)
        url
      end
    end
  end
end