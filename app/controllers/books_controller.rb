class BooksController < ApplicationController
    def new
        @book = Book.new
    end
    def show 
        @book = Book.find(params[:id]) 
    end
    def index
        if !params[:title].empty? && !params[:author].empty? && !params[:isbn].empty?
            @books = Book.where(title: params[:title], author: params[:author], isbn: params[:isbn])
        elsif !params[:title].empty? && !params[:author].empty?
            @books = Book.where(title: params[:title], author: params[:author])
        elsif !params[:title].empty? && !params[:isbn].empty?
            @books =  Book.where(title: params[:title], isbn: params[:isbn])
        elsif !params[:author].empty? && !params[:isbn].empty?
            @books = Book.where(author: params[:author],isbn: params[:isbn])
        elsif !params[:title].empty?
            @books = Book.where(title: params[:title])
        elsif !params[:author].empty?
            @books = Book.where(author: params[:author])
        elsif !params[:isbn].empty?
            @books = Book.where(isbn: params[:isbn])
        end
        if params[:search].eql?'1'
            render "index"
        else
            render "index_patron"
        end
       
    end

    def edit
        @book = Book.find(params[:id])
    end

    def update
        @book = Book.find(params[:id])
        if @book.update(book_params)
        redirect_to "/administrator/search/-1"
        else
        render 'edit' 
    end
    end


    def create
        @book = Book.new(book_params)
        if @book.save
        redirect_to "/administrator/index"
        else 
            render "new"
     end
    end
        private
        def book_params
        params.require(:book).permit(:title,:author,:isbn,:copies)
    
    end

end
 