module SessionsHelper

  def current_user
    @current_user ||= User.find_by(access_token: params[:session][:access_token])
  end

end
