class ReviewsController < ApplicationController
    def create
        @book = Book.find(params[:book_id])
        @review = @book.reviews.create(params.require(:review).permit(:reviewer, :body)) 
        redirect_to book_path(@book) 
        end

    def new 
        @book = Book.find(params[:book_id]) 
    end
end
