# encoding: utf-8

module Api
  module V1
    class SessionsController < DeviseTokenAuth::SessionsController
      protect_from_forgery with: :null_session
      include Concerns::ActAsApiRequest

      def resource_params
        params.require(:user).permit(:email, :password)
      end

      private

      def json_request?
        request.format.json?
      end

      def render_create_success
        render json: { user: resource_data }
      end
    end
  end
end
