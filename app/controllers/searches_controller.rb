class SearchesController < ApplicationController
  
  def search
    if params[:search].present?
      if params[:model] == "user"
        if params[:how] == "match"
          @user = User.where("name LIKE ?", "#{params[:search]}") 
        elsif params[:how] == "forward"
          @user = User.where("name LIKE ?", "#{params[:search]}%")
        elsif params[:how] == "backward"
          @user = User.where("name LIKE ?", "%#{params[:search]}")
        elsif params[:how] == "partical"
          @user = User.where("name LIKE ?", "%#{params[:search]}%")
        end
      elsif params[:model] == "book"
        if params[:how] == "match"
          @book = Book.where("title LIKE ?", "#{params[:search]}") 
        elsif params[:how] == "forward"
          @book = Book.where("title LIKE ?", "#{params[:search]}%")
        elsif params[:how] == "backward"
          @book = Book.where("title LIKE ?", "%#{params[:search]}")
        elsif params[:how] == "partical"
          @book = Book.where("title LIKE ?", "%#{params[:search]}%")
        end
      end
    end
  end



 private

    def match(model, value)
        if model == "user"
            User.where(name: value)
        elsif model == "book"
            Book.where(title: value)
        end
    end

    def forward(model, value)
        if model == "user"
            User.where("name LIKE ?", "%#{value}")
        elsif model == "book"
            Book.where("title LIKE ?", "%#{value}")
        end
    end

    def backward(model, value)
        if model == "user"
            User.where("name LIKE ?", "%#{value}")
        elsif model == "book"
            Book.where("title LIKE ?", "%#{value}")
        end
    end

    def partical(model, value)
        if model == "user"
            User.where("name LIKE ?", "%#{value}")
        elsif model == "book"
            Book.where("title LIKE ?", "%#{value}")
        end
    end

    def search_for(how)
        case how
        when "match"
            match(model, value)
        when "forward"
            forward(model, value)
        when "backward"
            backward(model, value)
        when "partical"
            partical(model, value)
        end
    end
end
