# frozen_string_literal: true

module Api
  module V1
    class ApiController < ActionController::API
      before_action :set_format_to_json

      private

      def set_format_to_json
        request.format = :json
      end
    end
  end
end
