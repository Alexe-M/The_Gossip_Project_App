class CitiesController < ApplicationController
  def new
    @cities = City.all
  end

  def show
    @city = City.find(params[:id])
    @gossips = Gossip.joins(:user).where(users: { city_id: @city.id })
  end

  def create
  end

  def edit
  end

  def destroy
  end

  def update
  end

  def index
  end

end
