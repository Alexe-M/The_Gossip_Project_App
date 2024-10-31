class SessionsController < ApplicationController

  def new
    # La méthode new est vide car elle sert uniquement à afficher le formulaire de connexion.
    # Une session n'est pas un objet persistant comme User, c'est un simple état temporaire stocké dans un hash, donc aucune donnée à préparer ici.  
  end

  def create
    @user = User.find_by(email: params[:email])

    if @user && @user.authenticate(params[:password])
      log_in(user)  # Utilisation de la méthode log_in au lieu de session[:user_id] = @user.id
      flash[:notice] = "Connexion réussie, bienvenue #{@user.first_name}!"
      redirect_to gossips_path
    else
      flash[:alert] = "Email ou mot de passe incorrect. Veuillez réessayer."
      render :new
    end
  end


  def destroy
    session.delete(:user_id) # Supprime l'ID de l'utilisateur de la session pour le déconnecter
    flash[:notice] = "Déconnexion réussie !"
    redirect_to new_session_path
  end




end
