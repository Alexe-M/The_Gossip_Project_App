class CommentsController < ApplicationController
  before_action :authenticate_user, only: [:new, :create, :edit]


  def index
    # Méthode qui récupère tous les potins et les envoie à la view index (index.html.erb) pour affichage
    @comments = Comment.all
  end

  def show
    # Méthode qui récupère le potin concerné et l'envoie à la view show (show.html.erb) pour affichage
    @comment = Comment.find(params[:id])
  end

  # CRUD CREATE
  def new
    # Méthode qui crée un potin vide et l'envoie à une view qui affiche le formulaire pour 'le remplir' (new.html.erb)
    @comment = Comment.new
  end

  def create
    # Méthode qui créé un potin à partir du contenu du formulaire de new.html.erb, soumis par l'utilisateur
    # pour info, le contenu de ce formulaire sera accessible dans le hash params (ton meilleur pote)
    # Une fois la création faite, on redirige généralement vers la méthode show (pour afficher le potin créé)
    @gossip = Gossip.find(params[:gossip_id])
    anonymous_user = User.find_by(first_name: "anonymous", last_name: "anonymous")

    @comment = @gossip.comments.create(content: params[:content], user: anonymous_user)

    if @comment.save
      redirect_to gossip_path(@gossip), notice: "Le commentaire a été créé avec succès !"
    else
      render :new
    end
  end

  
  # CRUD UPDATE
  def edit
    # Méthode qui récupère le potin concerné et l'envoie à la view edit (edit.html.erb) pour affichage dans un formulaire d'édition
    @gossip = Gossip.find(params[:gossip_id])
    @comment = Comment.find(params[:id])
  end

  def update
    # Méthode qui met à jour le potin à partir du contenu du formulaire de edit.html.erb, soumis par l'utilisateur
    # pour info, le contenu de ce formulaire sera accessible dans le hash params
    # Une fois la modification faite, on redirige généralement vers la méthode show (pour afficher le potin modifié)
    @comment = Comment.find(params[:id])
      if @comment.update(comment_params)
        redirect_to gossips_path
      else render :edit
    end
    

  end

  # CRUD DESTROY
  def destroy
    # Méthode qui récupère le potin concerné et le détruit en base
    # Une fois la suppression faite, on redirige généralement vers la méthode index (pour afficher la liste à jour)
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to gossips_path
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def authenticate_user
    unless current_user
      flash[:alert] = "Vous devez d'abord vous connectez à votre compte !"
      redirect_to new_session_path
    end
  end

end
