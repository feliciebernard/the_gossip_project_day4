class SessionsController < ApplicationController
  skip_before_action :only_signed_in

  def new

  end

  def create
  # cherche s'il existe un utilisateur en base avec l’e-mail
  @user = User.find_by(email: params[:email])

  # on vérifie si l'utilisateur existe bien ET si on arrive à l'authentifier (méthode bcrypt) avec le mot de passe 
  if @user && @user.authenticate(params[:password])
    session[:user_id] = @user.id 
    redirect_to gossips_path, notice: "bienvenue !"
  else
    flash.alert = "Utilisateur inexistant."
    render 'new'

  end
end

def destroy
  session.delete(:user_id)
  redirect_to gossips_path, success: "Vous êtes maintenant déconnecté"
end
end