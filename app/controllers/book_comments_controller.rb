class BookCommentsController < ApplicationController
  def create
    book = Book.find(params[:book_id])
    comment = BookComment.new(comment_params)
    comment.user_id = current_user.id
    comment.book_id = book.id
    comment.save
    redirect_back fallback_location: root_path
  end

  def destroy
    book = Book.find(params[:book_id])
    comment = current_user.book_comments.find_by(book_id: book.id)
    comment.destroy
    redirect_back fallback_location: root_path
  end

  private
  def comment_params
    params.require(:book_comment).permit(:comment)
  end

end
