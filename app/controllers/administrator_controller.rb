class AdministratorController < ApplicationController
    def index      
    end

    def search
        if !params[:id].eql?'-1'
            @book = Book.find(params[:id])
            @book.decrement!(:copies)
            @book.save
        end
      end
end
