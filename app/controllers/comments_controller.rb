class CommentsController < ApplicationController

  def create
    @book = Book.find(params[:book_id])
    comment = current_user.comments.new(comment_params)
    comment.book_id = @book.id
    comment.save
    redirect_to request.referer
  end

  def destroy
    @book = Book.find(params[:book_id])
    comment = Comment.find_by(book_id: @book.id, user_id: current_user)
    comment.destroy
    redirect_to request.referer
  end

  private

  def comment_params
    params.permit(:content)
  end

end
