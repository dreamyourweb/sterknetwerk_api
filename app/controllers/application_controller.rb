class ApplicationController < ActionController::Base
  protect_from_forgery
  respond_to :json, :html
  before_filter :authenticate_user!
  
  private
  #def authenticate_user
  #  @current_user = User.find_by_authentication_token(params[:token])
  #  unless @current_user
  #   respond_with({:error => "Token is invalid." })
  #  end
  #end
  #def current_user
  #  @current_user
  #end
end
