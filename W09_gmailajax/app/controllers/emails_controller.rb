class EmailsController < ApplicationController
  def index

  end

  def create
    @email = Email.new(
      object: Faker::Book.title,
      body: "plein de texte plein de texte plein de texte",
      read: false)
    if @email.save
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js { }
      end
    end
  end

  def show
    @email = Email.find(params[:id])
    @email.read = true
    @email.save

    respond_to do |format|
      format.html { redirect_to root_path }
      format.js { }
    end
  end

  def update
    @email = Email.find(params[:id])

    if @email.read == false
      @email.read = true
      @email.save
    else
      @email.read = false
      @email.save

      respond_to do |format|
        format.html { redirect_to root_path }
        format.js { }
      end
    end
  end


  def destroy
    @email = Email.find(params[:id])
    @email.destroy
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js { }
    end
  end

end