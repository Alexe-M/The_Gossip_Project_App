class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    puts "$" * 60
    puts params
    puts 
    puts "$" * 60

    @user = User.find(params[:id])

  end

  def new
    @user = User.new
  end

  def create

  end


  def edit

  end

  def update

  end

  def destroy

  end



end
