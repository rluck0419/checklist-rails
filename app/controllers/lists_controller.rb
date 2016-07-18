class ListsController < ApplicationController
  def show
    if List.exists?(params[:id])
      render template: 'lists/show.html.erb', locals: { list: List.find(params[:id]) }
    else
      render html: 'List not found', status: 404
    end
  end

  def index
    render template: 'lists/show.html.erb', locals: { list: List.all }
  end

  def new

  end

  def create

  end

  def edit

  end

  def update

  end

  def destroy

  end

  private
  def list_params
    params.require(:list).permit(:name)
  end
end
