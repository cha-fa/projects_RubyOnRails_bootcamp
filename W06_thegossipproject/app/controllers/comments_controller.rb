class CommentsController < ApplicationController
  before_action :has_account, only: [:create,:new]
  before_action :is_author, only: [:edit, :update, :destroy]

  def index

  end

  def show

  end
  def new
    @comment = Comment.new
  end

  def create

    @comment = Comment.create(user_id:current_user.id, gossip_id: params[:gossip_id], content: params[:content])
    if @comment.save
      redirect_to gossip_path(@comment.gossip.id)
    else 
      render :create
    end
  end

  def edit
    @comment = Comment.find(params[:id])
    @gossip = @comment.gossip
  end

  def update
    @comment = Comment.find(params[:id])
    comment_params = params.require(:comment).permit(:content)

    if @comment.update(comment_params)
      flash.alert = "Le commentaire a bien été modifié !"
      redirect_to gossip_path(@comment.gossip.id)
    else
      render edit_comment_path(params[:id])
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @gossip = @comment.gossip
    @comment.destroy
    flash.alert = "Le commentaire a bien été supprimé !"
    redirect_to @gossip
  end


  private

  def has_account
    unless logged_in?
      flash[:danger] = "Vous devez être connecté pour commenter"
      redirect_to new_session_path
    end
  end

  def is_author
    @comment = Comment.find(params[:id])
    @gossip = @comment.gossip
    unless logged_in? && current_user.id == @comment.user_id
      flash[:danger] = "Le commentaire ne peut être modifié que par son auteur"
      redirect_to @gossip

    end
  end

end