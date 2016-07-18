class TasksController < ApplicationController
  def show
    if Task.exists?(params[:id])
      render template: 'tasks/show.html.erb', locals: { task: Task.find(params[:id]) }
    else
      render html: 'Task not found', status: 404
    end
  end

  def index
    render template: 'tasks/index.html.erb', locals: { tasks: Task.all, lists: List.all }
  end

  def new
    render locals: {
      task: Task.new,
      list: List.find(params[:list_id])
    }
  end

  def create
    task = Task.new(task_params)
    task.list_id = params[:list_id]
    if task.save
      redirect_to list_task_path(params[:list_id], task)
    else
      render :new
    end
  end

  def edit
    render locals: {
      task: Task.find(params[:id]),
      list: List.find(params[:list_id])
    }
  end

  def update
    task = Task.find(params[:id])
    if task.update
      task(task_params)
    end
    task.list_id = params[:list_id]
    if task.save
      redirect_to list_task_path(params[:list_id], task)
    else
      render :edit
    end
  end

  def destroy
    if Task.exists?(params[:id])
      Task.destroy(params[:id])
      flash[:notice] = "Task deleted"
      redirect_to "/tasks"
    else
      flash[:alert] = "There was an error - please try again"
    end
  end

  private
  def task_params
    params.require(:task).permit(:body)
    params.require(:task).permit(:completed)
    params.require(:task).permit(:position)
  end
end
