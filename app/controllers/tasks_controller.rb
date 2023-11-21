class TasksController < ApplicationController
  before_action :task_finder, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new()
  end

  def create
    task = Task.new(task_params)
    task.save
    redirect_to tasks_path
  end

  def show
  end


  def edit
  end

  def update
    @task.update(task_params)
    redirect_to tasks_path
  end

  def destroy
    @task.destroy
    redirect_to tasks_path, status: :see_other
  end

  private

  def task_params
    params.require(:task).permit(:title, :detail, :completed)
  end

  def task_finder
    @task = Task.find(params[:id])
  end

end
