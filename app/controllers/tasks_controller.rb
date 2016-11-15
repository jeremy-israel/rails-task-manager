class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    my_task = Task.create(name: set_params[:name], done: false)
    redirect_to task_path(my_task)
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    task = Task.find(params[:id])
    task_name = params[:task][:name]
    task_status = params[:task][:done] == "1"
    task.update(name: task_name, done: task_status)
    # raise
    redirect_to task_path(task)
  end

  def destroy
    Task.find(params[:id]).delete
    redirect_to tasks_path
  end

  private

  def set_params
    params.require(:task).permit(:name)
  end
end
