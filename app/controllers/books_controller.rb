class BooksController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_book, only: [:show, :edit, :update]
  before_action :new_book, only: [:create, :update]

  def index
    @books = Book.all
    render json: @books
  end

  def show
    if @book
      render json: @book
    else
      render json: { errors: "Book not found" }, status: :not_found
    end
  end

  def new
    # render from form in views/books new.html.erb
    @book = Book.new
  end

  def create
    if @book.save

      render json: @book, status: :created, location: @book
    else
      render json: { errors: @book.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def edit
    # render from form in views/books edit.html.erb
  end

  def update
    if @book.update(book_params)
      render json: @book, status: :ok, location: @book
    else
      render json: { errors: @book.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy

    @book.destroy
    render json: { message: "Book successfully deleted" }, status: :ok
  end

  private

  def set_book
    @book = Book.find_by_hashid(params[:hashid])
  end

  def book_params
    params.require(:book).permit(:title, :author, :publisher, :genre, :image_url)
  end

  def new_book
    @book = Book.new(book_params)
  end

end
