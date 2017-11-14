class ProjectsController < ApplicationController
  
  # before_action :authenticate_user!
  before_action :set_product, only: [:show, :edit, :update]
  
  def index
    @projects = Project.all
  end

  def create
  	@project = Project.new(project_params.merge(manager_id: current_user.id))
  	respond_to do |format|
  		if @project.save
  			format.html { redirect_to projects_path, notice: 'Project created successflly!' }
  	  else
  	  	format.html { render :new }
  	  end
  	end
  end

  def update
    if @project.update_attributes(project_params)
      format.html { redirect_to projects_path, notice: 'Project Updated successflly!' }
    else
      format.html { render :edit }
    end
  end

  private

  def project_params
  	params.require(:project).permit(:name, :descrition, :project_type, :client_name)
  end

  def set_product
    @project = Project.find(params[:id])
  end
end
