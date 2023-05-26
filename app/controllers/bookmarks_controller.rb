class BookmarksController < ApplicationController
  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def create
    # raise
    @list = List.find(params[:list_id])
    @movie = Movie.find(params[:bookmark][:movie_id])
    comment =  params[:bookmark][:comment]


    @bookmark = Bookmark.new(comment: comment, movie: @movie, list: @list)
    @bookmark.save
    redirect_to list_path(@list)
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to list_path(@list), status: :see_other
  end

  # private

  # def bookmark_params
  #   params.require(:bookmark).permit(:comment, :list_id, :movie_id)
  # end
end
