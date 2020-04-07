class BookCommentsController < ApplicationController
	def create
		@book1=Book.find(params[:book_id])
		@book_comment=BookComment.new(book_comment_params)
		@book_comment.user_id=current_user.id
		@book_comment.book_id=@book1.id
		if @book_comment.save
		redirect_to book_path(@book1.id)
	   else
	   	@user=@book1.user
	   	@book=Book.new
		render '/books/show'
	    end
	end
	def destroy
		book1=Book.find(params[:book_id])
	    comment=BookComment.find_by(book_id: params[:book_id])
	    comment.destroy
  	    redirect_to  book_path(book1.id), notice: "successfully delete comment!"
	end
	private
	def book_comment_params
		params.require(:book_comment).permit(:comment)
    end
end
