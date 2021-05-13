class GossipsController < ApplicationController

  def index
    @gossips = Gossip.all
  end

  def show
    @gossips = Gossip.find(params[:id])
  end

  def new
    @gossips = Gossip.new
  end

  def create
    @gossips = Gossip.create(post_params)

    if @gossips.save
      redirect_to gossips_path
    else
      puts "try again"
      render :new
    end
  end

  def edit
    @gossips = Gossip.find(params[:id])
  end

  def update
    @gossips = Gossip.find(params[:id])
    if @gossips.update(post_params)
      redirect_to gossips_path
    else
      render :edit
    end
  end

  def destroy
    @gossips = Gossip.find(params[:id])
    @gossips.destroy
    redirect_to gossips_path
  end

  private
  def post_params
    params.require(:gossip).permit(:title, :content)
  end
end