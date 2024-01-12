class BookmarksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_bookmark, only: [:show, :edit, :update, :destroy]

  def index
    @bookmarks = current_user.bookmarks.includes(:book)
  end

  def show
  end

  def edit
    # render from form in views/bookmarks edit.html.erb
  end

  def update
    @bookmark.update(bookmark_params)

    if @bookmark.save
      redirect_to bookmarks_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @bookmark.destroy
    redirect_to bookmarks_path, status: :see_other
  end

  private

  def set_bookmark
    @bookmark = current_user.bookmarks.find(params[:id])
  end
def bookmark_params
    params.require(:bookmark).permit(:book_id)
  end

end
