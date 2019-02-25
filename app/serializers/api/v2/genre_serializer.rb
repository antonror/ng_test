module Api
  module V2
    class GenreSerializer < ActiveModel::Serializer
      attributes :name, :movies_count
    end
  end
end