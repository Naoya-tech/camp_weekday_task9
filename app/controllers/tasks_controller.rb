class TasksController < ApplicationController
#リファクタリングの追加
before_action :set_task, only: [ :show, :edit, :update, :destroy]

  def index
    @tasks = Task.order(created_at: "desc").limit(5)
  end

  def show
  end

  def new
    @task = Task.new
  end

  def edit
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
    if @task.update(task_params)
      flash[:notice] = "タスクを更新しました。"
      redirect_to @task
    else
      render "edit"
    end
  end

  def destroy
    @task.delete
    redirect_to tasks_path
  end

  def hide
    @tasks = Task.all
  end

  private

  def task_params # ストロングパラメータを定義する
    params.require(:task).permit(:title, :memo, :status)
  end

  #リファクタリングの追加
  def set_task
    @task = Task.find(params[:id])
  end


end
