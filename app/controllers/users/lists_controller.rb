module Users
  class ListsController < ApplicationController
    before_action :set_user

    def index;end

    def show
      @list = List.find(params[:id])
    end

    def new
      @list = @user.lists.build
    end

    def create
      @list = @user.lists.build(list_params)
      if @list.save
        redirect_to user_lists_path(@user), notice: 'List created successfully.'
      else
        flash.now[:error] = ['Error', @list.errors.full_messages].flatten
        render :new
      end
    end

    def edit
      @list = List.find(params[:id])
    end

    def update
      @list = List.find(params[:id])
      if @list.update(list_params)
        redirect_to user_lists_path(@user), notice: 'List updated!'
      else
        flash.now[:error] = ['Error!', @list.errors.full_messages].flatten
        render :edit
      end
    end
    
    def destroy
      @list = List.find(params[:id])
      if @list.destroy
        flash[:notice] = 'List deleted'
      else
        flash[:error] = 'Could not delete list. Try again'
      end
      redirect_to user_lists_path(@user)
    end

    private

    def list_params
      params.require(:list).permit(:name, :progress, :user_id,
                                    book_lists_attributes: [:_destroy, :list_id, :book_id,
                                    user_book_attributes: [:user_id, :book_id, :book_status,
                                    :favorite_book, :favorite_author, :_destroy]])
    end

    def set_user
      @user = User.find(params[:user_id])
    end
  end
end
