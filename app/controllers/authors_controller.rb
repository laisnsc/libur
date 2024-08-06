class AuthorsController < ApplicationController

  def show
    @author = Author.find(params[:id])
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.new(params[:author])
    if @author.save
      flash[:notice] = "Author was added to database."
      redirect_to author_page(@author)
    else
      flash.now[:alert] = "Author was not added to database."
      render :action => 'new'
    end
  end
  def update
    if @author.update(params[:author])
      redirect_to author_path(@author)
      flash[:notice] = "Author was updated."
    else
      redirect_to author_path(@author)
      flash.now[:alert] = "Author was not updated."
    end
  end

  private

  def author_params
    params.require(:author).permit(:name, :birth_date, :nationality, :transliterated_name,
                                   books_attributes: [:author_id, :genre_id, :title, :synopsis,
                                                      :release_year, :language, :_destroy])
  end
end
