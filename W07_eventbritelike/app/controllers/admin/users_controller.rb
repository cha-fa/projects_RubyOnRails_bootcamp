class Admin::UsersController < Admin::BaseController


  def index

  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    @user.update(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      description: params[:description],
      is_admin: params[:is_admin],
      )
    if @user.save
      redirect_to admin_user_path(@user.id)
      flash.alert = "L'utilisateur a été modifié !"
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_users_path
    flash.alert = "L'utilisateur #{params[:id]} a bien été supprimé !"

  end

end