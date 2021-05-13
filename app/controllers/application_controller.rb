class ApplicationController < ActionController::Base
  include SessionsHelper


  private

  def only_signed_in

    if !session[:auth] || !session[:auth]['id']
      redirect_to new_user_path, danger: "Vous n'avez pas le droit d'accéder à la page"
    end
  end
  
end