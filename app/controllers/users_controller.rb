class UsersController < ApplicationController
  before_action :authenticate_user!
    # ログイン前に指定したコントローラを見れなくする
    before_action :correct_user, only: [:edit, :update]
  def top
  end

  def show
  	@user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  	# @books = @user.books.page(params[:page]).reverse_order
  end

  def follows
    @user = User.find(params[:id])
    @users = @user.followings
  end

  def followers
    @user = User.find(params[:id])
    @users = @user.followers
  end

  def index
    @book = Book.new
  	@users = User.all
  end

  def correct_user
    @user = User.find(params[:id])
    if
      @user != current_user
      redirect_to user_path(current_user)
    end
  end

  def edit
  	@user = User.find(params[:id])
    #   if
    #   @user != current_user
    #   redirect_to user_path(current_user)、上のcorrect_userと同じ意味
    # end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: "You have updated book successfully."
    else
      render :edit
    end
  end

  def user_params
  params.require(:user).permit(:name, :profile_image, :introduction)
  end
end


