class GossipsController < ApplicationController
  before_action :has_account, only: [:create,:new]
  before_action :is_author, only: [:edit, :update, :destroy]

  def index
    @gossip = Gossip.new
  end

  def show
    @gossip = Gossip.find(params['id'])
    
    
  end

  def create
    @gossip = Gossip.create(title:params[:title], content: params[:content], user_id: current_user.id)

    if @gossip.save
      redirect_to action: 'index'
      flash.alert = "Le potin a bien été enregistré !"
    else
      render 'new'
    end
  end

  def new 
    @gossip = Gossip.new
  end

  def edit
    @gossip = Gossip.find(params['id'])
  end

  def update
    @gossip = Gossip.find(params[:id])
    @gossip.update(title: params[:new_title], content: params[:new_content])

    if @gossip.update(title: params[:new_title], content: params[:new_content])
      redirect_to @gossip
      flash.alert = "Le potin a bien été modifié !"
    else
      render :edit
    end
  end

  def destroy
    @gossip = Gossip.find(params[:id])
    @gossip.destroy
    redirect_to root_path
    flash.alert = "Le potin n°#{params[:id]} a bien été supprimé !"
  end


  private

  def has_account
    unless logged_in?
      flash[:danger] = "Vous devez être connecté pour publier ou modifier un potin."
      redirect_to new_session_path
    end
  end

  def is_author
    @gossip = Gossip.find(params[:id])
    unless logged_in? && current_user.id == @gossip.user_id
      flash[:danger] = "Le potin ne peut être modifié que par son auteur"
      redirect_to @gossip

    end
  end

end