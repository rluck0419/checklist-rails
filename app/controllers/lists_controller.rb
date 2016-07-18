class ListsController < ApplicationController
  def show
    if List.exists?(params[:id])
      render template: 'lists/show.html.erb', locals: { list: List.find(params[:id]) }
    else
      render html: 'List not found', status: 404
    end
  end

  def index
    render template: 'lists/index.html.erb', locals: { lists: List.all }
  end

  def new
    render locals: {
      list: List.find(params[:id])
    }
  end

  def create
    list = List.new(list_params)
    if task.save
      redirect_to list
    else
      render :new
    end
  end

  def edit
    render locals: {
      list: List.find(params[:id])
    }
  end

  def update
    list = List.find(params[:id])
    if list.update(list_params)
      redirect_to list
    else
      render :edit
    end
  end

  def destroy
    if List.exists?(params[:id])
      List.destroy(params[:id])
      flash[:notice] = "List (& list tasks) deleted"
      redirect_to "/lists"
    else
      flash[:alert] = "There was an error - please try again"
    end
  end

  private
  def list_params
    params.require(:list).permit(:name)
  end
end
