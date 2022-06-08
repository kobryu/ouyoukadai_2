class PostCommentsController < ApplicationController
  before_action :ensure_correct_user, only: [:destroy]
  def create
    @book = Book.find(params[:book_id])
    comment = PostComment.new(post_comment_params)
    comment.user_id = current_user.id
    comment.book_id = @book.id
    comment.save
  end

  def destroy
    @book = Book.find(params[:book_id])
    PostComment.find(params[:id]).destroy
  end

  def ensure_correct_user
    @comment = PostComment.find(params[:id])
    unless @comment.user == current_user
      redirect_to books_path
    end
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
end
