class TasksController < ApplicationController
  def index
    @tasks = Task.all.order(created_at: "desc").limit(5)
  end
end
