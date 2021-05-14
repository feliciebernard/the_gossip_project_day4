class ApplicationController < ActionController::Base
  include SessionsHelper

  before_action :only_signed_in
 # helper_method :current_user
  
  private

  def only_signed_in

    if !current_user
      redirect_to new_user_path, danger: "Vous n'avez pas le droit d'accéder à la page"
    end
  end

  #def current_user
   # return nil if !session[:auth] || !session[:auth]['id']
    #return @user if @user
    #@user = User.find(session[:auth]['id'])
  #end
end