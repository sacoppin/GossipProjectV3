class GossipsController < ApplicationController
 
  def show
    @gossips = Gossip.all
    # @gossips = Gossip.find(params[:id])
    # @id = params[:id]
  end

  def index
    @gossips = Gossip.all
  end

  def create
    @gossips = Gossip.new(title: params[:Create_Title], content: params[:Create_Content])
    if @gossips.save
      flash[:gossip_success] = "Le Gossip a bien été créé."
    redirect_to '/'
    else
      flash[:alert] = "Potin non enregistré"
      render('new')
    end
  end
end