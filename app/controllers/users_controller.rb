class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Account successfuly created. Welcome, #{@user.username}"
      redirect_to articles_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def index
  end

  def show
  end

  def destroy
  end

  private

    def user_params
      params.require(:user).permit(:username, :email, :password)
    end
  
end