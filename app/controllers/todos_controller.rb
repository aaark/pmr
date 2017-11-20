class TodosController < ApplicationController
  before_action :set_todo, only: [:show, :edit, :update]
  before_action :set_project

  def index
    @todos = Todo.all
  end
  
  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params.merge(project_id: @project.id))
    respond_to do |format|
      if @todo.save
        format.html { redirect_to project_todos_path(@project), notice: 'TODO created successflly!' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    if @todo.update_attributes(todot_params)
      format.html { redirect_to todos_path, notice: 'TODO Updated successflly!' }
    else
      format.html { render :edit }
    end
  end

  private

  def todo_params
    params.require(:todo).permit(:name, :complexity, :status, :developer_id, :estimated_time)
  end

  def set_todo
    @todo = Todo.find(params[:id])
  end

  def set_project
    @project = Project.find(params[:project_id])
  end
end

