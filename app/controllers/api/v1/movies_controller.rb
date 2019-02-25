module Api
  module V1
    class MoviesController < Api::ApplicationController

      def index
        render json: Movie.all,
               each_serializer: Api::V1::MovieSerializer
      end

      def show
        render json: Movie.find(params[:id].to_i),
               serializer: Api::V1::MovieSerializer
      end

    end
  end
end