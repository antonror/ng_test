module Api
  module V2
    class MovieSerializer < ActiveModel::Serializer
      attributes :title
      belongs_to :genre
    end
  end
end