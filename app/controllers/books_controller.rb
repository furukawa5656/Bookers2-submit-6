class BooksController < ApplicationController
  before_action :authenticate_user!
  # ログイン前に指定したコントローラを見れなくする
  before_action :correct_user, only: [:edit, :update]

  def index
  	@books = Book.all
    @book = Book.new
  end

  # def new
  # 	@book = Book.new
  # end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id# user_idの情報はフォームからはきていないので、deviseのメソッドを使って「ログインしている自分のid」を代入アソシエーションをした状態でデータの保存をすることができました！
    if @book.save
    redirect_to book_path(@book.id), notice: "Book was successfully created."
    else
    @books = Book.all
    render :index
    end
  end

  def show
    @books = Book.find(params[:id])
    @book = Book.new
    @book_comment = BookComment.new
    # @user = @books.user
  end


  def correct_user
    @book = current_user.books.find_by(id: params[:id])
    unless @book
      redirect_to books_path
    end
  end


  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book.id), notice: "Book was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    if book.destroy
    redirect_to books_path
    end
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
