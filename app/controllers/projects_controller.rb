class ProjectsController < ApplicationController
  def index
  end

  def new
  	@project = Project.new
  end

  def edit
  end

  def create
  	@project = Project.new(project_params)
  	respond_to do |format|
  		if @project.save
  			format.html { redirect_to projects_path, notice: 'Project created successflly!' }
  	  else
  	  	format.html { render :new }
  	  end
  	end
  end

  private

  def project_params
  	params.require(:project).permit(:name, :descrition, :project_type, :client_name)
  end
end
