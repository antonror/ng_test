module PairGuruMovieApi
  class Base < JsonApiClient::Resource
    self.site = "https://#{PairGuruMovieApi.hostname}/api/v1/"

    def self.cached_find(*args)
      Rails.cache.fetch("PairGuruMovieApi::#{self.class}.find/#{args.join('/')}", expires_in: 1.hour) do
        self.find(*args)
      end
    end
  end
end