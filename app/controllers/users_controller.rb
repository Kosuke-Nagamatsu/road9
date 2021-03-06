class UsersController < ApplicationController
  skip_before_action :login_required, only: [:new, :create]
  before_action :set_user, only: [:show, :edit, :update]
  def new
    @user = User.new
  end
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user.id)
    else
      render :new
    end
  end
  def show
  end
  def edit
    redirect_to user_path(current_user.id) unless @user == current_user
  end
  def update
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: "プロフィールを編集しました！"
    else
      render :edit
    end
  end
  private
  def user_params
    params.require(:user).permit(
      :name, :birthday, :image, :image_cache,
      :email, :password, :password_confirmation)
  end
  def set_user
    @user = User.find(params[:id])
  end
end
