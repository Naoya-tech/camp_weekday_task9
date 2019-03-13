class TasksController < ApplicationController
  def index
    @tasks = Task.all.order(created_at: "desc").limit(5)
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def edit
    @task = Task.find(params[:id])
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      flash[:notice] = "登録に成功しました。"
      redirect_to @task
    else
      render "new"
    end
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      flash[:notice] = "タスクを更新しました。"
      redirect_to @task
    else
      render "edit"
    end
  end
  
  private

  def task_params # ストロングパラメータを定義する
    params.require(:task).permit(:title, :memo, :status, :is_display)
  end



end
