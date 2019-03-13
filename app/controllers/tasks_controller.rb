class TasksController < ApplicationController
  def index
    @tasks = Task.all.order(created_at: "desc").limit(5)
  end

  def new
    @task = Task.new
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
end
