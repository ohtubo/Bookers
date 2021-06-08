class BooksController < ApplicationController

  def index
    @book = Book.new
    @books =Book.all.order(id: "DESC")
  end

  def show

    @book = Book.find(params[:id])

  end

  def create
    # １. データを新規登録するためのインスタンス作成
    @book = Book.new(book_params)
    # ２. データをデータベースに保存するためのsaveメソッド実行
    if @book.save
      flash[:notice] = "Book was successfully created."
      redirect_to booklist_path(@book.id)
    else
      render :index
    end
  end

  def edit

    @book = Book.find(params[:id])

  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to booklist_path(book.id)
      flash[:notice] = "Book was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    if book.destroy
      redirect_to books_path(book.id)
      flash[:notice] = "Book was successfully destroyed."
    else
      redirect_to books_path(@book.id)
    end


  end

  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
