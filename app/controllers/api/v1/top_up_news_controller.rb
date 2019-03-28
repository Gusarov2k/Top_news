module Api
  module V1
    class TopUpNewsController < ApplicationController
      def index
        @all_news = TopUpNews.order('created DESC')
        render json: @all_news
      end
    end
  end
end
