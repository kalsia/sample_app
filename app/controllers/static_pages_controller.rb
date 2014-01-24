class StaticPagesController < ApplicationController
  def home
    @books = Book.paginate(page: params[:page], :per_page => 6, :order => 'created_at DESC')
  end

  def doc
  end
end
