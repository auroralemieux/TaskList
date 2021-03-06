class TasksController < ApplicationController

  def index
    @tasks = Task.all.order(:completed, :priority)
  end

  def show
    @task = Task.find(params[:id])
    @next_id = Task.where("id > ?", @task.id).first
    @prev_id = Task.where("id < ?", @task.id).last
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      redirect_to tasks_path
    else
      render :new
    end
  end

  def complete
    @task = Task.find(params[:id])
    if @task.completed == nil
      @task.completed = Time.now
    else
      @task.completed = nil
    end
    @task.save
    redirect_to tasks_path
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])

    if @task.update(task_params)
      redirect_to tasks_path
    else
      render :edit
    end
  end

  def destroy
    @task = Task.find(params[:id]).destroy
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :due, :priority, :completed)
  end


end
