class StaticPagesController < ApplicationController
  def home
    @gossips = Gossip.all
  end

  def team
  end

  def contact
  end

  def welcome
    # pour afficher une page de bienvenue custom
    @first_name = params[:first_name]
  end
  
end
