module Api
  module V1
    class TopUpNewsController < ApplicationController
      include ActionController::HttpAuthentication::Token::ControllerMethods
      before_action :authenticate, only: %i[create destroy]

      def index
        @all_news = TopUpNews.order('created DESC')
        render json: @all_news
      end

      def create
        @news = TopUpNews.new(news)
        if @news.save
          render json: @news, status: :created
        else
          render json: @news.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @news = TopUpNews.find_by(params[:id])
        if @news
          @news.destroy
        else
          render json: { post: 'not found' }, status: :not_found
        end
      end

      private

      def authenticate
        authenticate_or_request_with_http_token do |token, _options|
          @user = User.find_by(token: token)
        end
      end
    end
  end
end
