module Api
  module V2
    class MoviesController < Api::ApplicationController

      def index
        render json: Movie.all.includes(:genre),
               each_serializer: Api::V2::MovieSerializer,
               include: [:genre]
      end

      def show
        render json: Movie.find(params[:id].to_i),
               serializer: Api::V2::MovieSerializer,
               include: [:genre]
      end

    end
  end
end