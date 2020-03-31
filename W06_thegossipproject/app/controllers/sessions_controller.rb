class SessionsController < ApplicationController


  def new
    # La view new va juste demander l’e-mail et le mot de passe à l'utilisateur via un formulaire, ce dernier pointant vers la méthode create. 
  end

  def create
      # cherche s'il existe un utilisateur en base avec l’e-mail
      user = User.find_by(email: params[:email])

  # on vérifie si l'utilisateur existe bien ET si on arrive à l'authentifier (méthode bcrypt) avec le mot de passe 
  if user && user.authenticate(params[:password])
    session[:user_id] = user.id
    redirect_to root_path
    flash.alert = "Vous êtes bien connecté !"
    # redirige où tu veux, avec un flash ou pas

  else
    flash.now[:danger] = "L'email ou le mot de passe est incorrect"
    render 'new'
  end
end




def destroy
  session.delete(:user_id)
  redirect_to root_path
end

end