class BooksController < ApplicationController
  def index
    @books = Book.all
    respond_to do |format|
      format.html
      format.text
      format.csv do
        render plain: Book.generate_csv(@books)
      end
      # format.json { render json: @resource }
    end
  end
  def self.generate_csv(book_list)
  header = ['id', 'title', 'author', 'already_read']

  CSV.generate(headers: true) do |csv|
    csv << header

    book_list.each do |book|
      csv << [book.id, book.title, book.author, book.already_read]
    end
  end
end
end
