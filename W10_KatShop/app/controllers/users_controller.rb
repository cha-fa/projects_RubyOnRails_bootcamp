class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
      if @user.update(first_name: params[:first_name], last_name: params[:last_name], email: params[:email])
        flash[:success] = "Vos informations personnelles ont été modifiées"
        redirect_to @user
      else
        flash[:alert] = "Vos informations personnelles n'ont pas été modifiées"
        redirect_to @user
      end
  end
end
