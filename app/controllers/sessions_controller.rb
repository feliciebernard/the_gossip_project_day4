class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
  # cherche s'il existe un utilisateur en base avec l’e-mail
  user = User.find_by(email: params[:email])

  # on vérifie si l'utilisateur existe bien ET si on arrive à l'authentifier (méthode bcrypt) avec le mot de passe 
  if user && user.authenticate(params[:password])
    session[:user_id] = user.id
    puts "Login ok"
    flash[:success] = "Connection établie !"
    redirect_to gossip_path
  else
    flash[:alert] = "Utilisateur inexistant !"
    render 'new'
  end
end

def destroy
  session.delete(current_user.id)
  session[:user_id] = nil
  puts "Utilisateur déconnecté"
  flash[:notice] = "A bientôt sur The Hacking Project !"
end
end