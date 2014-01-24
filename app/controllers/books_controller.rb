class BooksController < ApplicationController
  before_filter :signed_in_user

  def new
    @book = Book.new
  end

  def create
    @book = current_user.books.build(params[:book])
    if @book.save
      flash[:success] = "Book created correctly, check it out in the books catalog!"
      redirect_to root_url
    else
      render 'books/new'
    end
  end

  def show
    @book = Book.find(params[:id])

  end

  def edit
     @book = Book.find(params[:id])
  end













  def update
    @book = Book.find(params[:id])

    if @book.update_attributes(params[:book])
      flash[:success] = "Book updated"
      redirect_to @book
    else
      render 'edit'
    end
  end

  def destroy
    Book.find(params[:id]).destroy
    flash[:success] = "Book destroyed."
    redirect_to root_url
  end
end