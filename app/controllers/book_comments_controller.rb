class BookCommentsController < ApplicationController
	def create
		book = Book.find(params[:book_id])
		comment = current_user.book_comments.new(book_comment_params)
		comment.book_id = book.id
		comment.save
		redirect_back(fallback_location: books_path)
	end

	def edit
		@book = Book.find(params[:book_id])
		redirect_back(fallback_location: books_path)
	end

	def update
		@book = Book.find(params[:book_id])
		@comment = @book.book_comments.find(params[:id])
		@comment.update(book_comment_params)
		redirect_back(fallback_location: books_path)
	end

	def destory
		@book = Book.find(params[:book_id])
		@comment = @book.book_comments.find(params[:id])
		@comment.destory
		redirect_back(fallback_location: books_path)
	end

	private

	def book_comment_params
		params.require(:book_comment).permit(:user_id, :book_id, :comment)
	end
end
