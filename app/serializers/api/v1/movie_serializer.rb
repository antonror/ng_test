module Api
  module V1
    class MovieSerializer < ActiveModel::Serializer
      attributes :title
    end
  end
end
