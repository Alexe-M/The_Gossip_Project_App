class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show 
   @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in(@user)
      flash[:success] = "Vous êtes connecté avec succès !"
      redirect_to gossips_path
    else
      flash[:alert] = "Tous les champs sont obligatoires, le mot de passe doit contenir au moins 6 caractères"
      render :new
    end
    # puts @user.errors.full_messages
  end
  

  def edit

  end

  def update


  end

  def destroy

  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :city_id)
  end


end
