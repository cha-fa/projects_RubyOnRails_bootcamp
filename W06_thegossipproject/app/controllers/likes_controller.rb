class LikesController < ApplicationController
# before_action :find_like, only: [:destroy]

  def new
    @like = Like.new
  end

  def create

    if already_liked?
      flash[:notice] = "On ne peut liker un potin qu'une fois"
    else 
      @like = Like.create(user_id: current_user.id, gossip_id: params[:gossip_id])
      redirect_to gossip_path(@like.gossip.id)
    end
  end

  def destroy
    @like = Like.find(params[:id])
    @gossip = @like.gossip
    @like.destroy
    redirect_to @gossip
  end


private

  def already_liked?
    Like.where(user_id: current_user.id, gossip_id: params[:gossip_id]).exists?
  end

end