class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
      @user = User.from_omniauth(request.env['omniauth.auth'])

      if @user.persisted?
        flash[:notice] = I18n.t 'devise.omniauth_callbacks.success', kind: 'Google'
        sign_in @user, event: :authentication
        redirect_to params[:state]
      else
        flash[:notice] = I18n.t 'devise.omniauth_callbacks.failure'
        redirect_to params[:state]
      end
  end
end
