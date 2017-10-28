module Api
  module V1
    class Users::BorrowedProductsController < ApplicationController
      def index
        render plain: "text", status: 200
      end

    end
  end
end
