class BookmarksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_bookmark, only: [:show, :edit, :update, :destroy]

  def index
    @bookmarks = current_user.bookmarks.includes(:book [:hashid])
    render json: @bookmarks
  end

  def show
    render json: @bookmark
  end

  def edit
    # render from form in views/bookmarks edit.html.erb
  end

  def update
    if @bookmark.update(bookmark_params)
      render json: @bookmark, status: :ok
    else
      render json: { errors: @bookmark.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @bookmark.destroy
    render json: { message: "Bookmark successfully deleted" }, status: :ok
  end

  private

  def set_bookmark
    @bookmark = current_user.bookmarks.find_by_hashid(params[:id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:book_id)
  end

end
