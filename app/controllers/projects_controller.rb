class ProjectsController < ApplicationController
  before_filter :authenticate_user!
  def index
    @projects = current_user.projects.all
    
  end

  def new
    @project = Project.new
  end

  def create
    @project = current_user.projects.build(params[:project])
    if @project.save
      redirect_to "/projects/#{@project.id}"
    else
      render :action => 'new'
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    if @project.update_attributes(params[:project])
      redirect_to "/projects/#{@project.id}"
    else
      render :action => 'edit'
    end
  end

  def show
    @project = Project.find(params[:id])
  end

  def destroy
    @project = Project.find(params[:id])
    if @project.destroy
      redirect_to projects_path
    end
  end
end
