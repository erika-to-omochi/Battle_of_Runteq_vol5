class BookmarksController < ApplicationController
  before_action :require_login
  def index
    @bookmark_boards = current_user.bookmark_boards.includes(:user)
  end

  def create
    board = Board.find(params[:board_id])
    current_user.bookmark(board)
    redirect_to boards_path, notice: 'お気に入りに登録しました♥', status: :see_other
  end

  def destroy
    board = current_user.bookmarks.find(params[:id]).board
    current_user.unbookmark(board)
    redirect_to boards_path, notice: 'お気に入りから外しました♡', status: :see_other
  end
end