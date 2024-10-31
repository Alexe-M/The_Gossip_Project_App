class GossipsController < ApplicationController
  before_action :authenticate_user, only: [:new, :create, :show, :edit]
  before_action :authenticate_owner_user, only: [:edit, :destroy, :update]
  # attr_accessor :gossip

  # les 7 méthodes en REST 

  # CRUD READ
  def index
    # Méthode qui récupère tous les potins et les envoie à la view index (index.html.erb) pour affichage
    @gossips = Gossip.all
  end

  def show
    # Méthode qui récupère le potin concerné et l'envoie à la view show (show.html.erb) pour affichage
    @gossip = Gossip.find(params[:id])
  end

  # CRUD CREATE
  def new
    # Méthode qui crée un potin vide et l'envoie à une view qui affiche le formulaire pour 'le remplir' (new.html.erb)
    @gossip = Gossip.new
  end

  def create
    @gossip = Gossip.new(gossip_params)
    @gossip.user = current_user
    
    if @gossip.save
      redirect_to gossip_path(@gossip), notice: "Le potin a été créé avec succès !"
    else
      render :new
    end
  end
  
  
  # CRUD UPDATE
  def edit
    # Méthode qui récupère le potin concerné et l'envoie à la view edit (edit.html.erb) pour affichage dans un formulaire d'édition
    @gossip = Gossip.find(params[:id])
  end

  def update
    # Méthode qui met à jour le potin à partir du contenu du formulaire de edit.html.erb, soumis par l'utilisateur
    # pour info, le contenu de ce formulaire sera accessible dans le hash params
    # Une fois la modification faite, on redirige généralement vers la méthode show (pour afficher le potin modifié)
    @gossip = Gossip.find(params[:id])
      if @gossip.update(gossip_params)
        redirect_to gossip_path
      else render :edit
    end
    

  end

  # CRUD DESTROY
  def destroy
    # Méthode qui récupère le potin concerné et le détruit en base
    # Une fois la suppression faite, on redirige généralement vers la méthode index (pour afficher la liste à jour)
    @gossip = Gossip.find(params[:id])
    @gossip.comments.destroy_all
    @gossip.tags.destroy_all
    @gossip.likes.destroy_all
    @gossip.destroy
    redirect_to gossips_path
  end

  private

  def gossip_params
    params.require(:gossip).permit(:title, :content)
  end


  def authenticate_user
    unless current_user
      flash[:danger] = "Veuillez d'abord vous connectez à votre compte"
      redirect_to new_session_path
    end
  end

  def authenticate_owner_user
    @gossip = Gossip.find(params[:id])  # Trouve le potin correspondant
    unless current_user == @gossip.user
      flash[:danger] = "Vous n'être pas le créateur de ce potin"
      redirect_to gossips_path
    end
  end

  
end
