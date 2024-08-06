class Authors::BooksController < AuthorsController
  before_action :set_author, only: %i[new create update]


  private

  def set_author
    @author = Author.find(params[:id])
  end
end