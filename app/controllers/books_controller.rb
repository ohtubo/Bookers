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
    book = Book.new(book_params)
    # p book
    # logger.debug("標準出力とログファイルに記録される2")
    # ２. データをデータベースに保存するためのsaveメソッド実行
    book.save
    # ３. トップ画面へリダイレクト
    redirect_to '/books'
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to books_path(book.id)
  end

  def destroy
    book = Book.find(params[:id])  # データ（レコード）を1件取得
    book.destroy  # データ（レコード）を削除
    redirect_to books_path(book.id)  # 投稿一覧画面へリダイレクト
  end

  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
