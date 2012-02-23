class PagesController < ApplicationController
  def new
    @project = Project.find(params[:project_id])
    @page = @project.pages.build
  end

  def create
    @page = Page.new(params[:page])
    if @page.save
      redirect_to "/projects/#{@page.project_id}", :notice => "Page added successfully"
    else
      render action => 'new'
    end
  end

  def edit
    @page = Page.find(params[:id])
    @project = @page.project
  end
   
  def update
    @page = Page.find(params[:id])
    @project = @page.project
    if @page.update_attributes(params[:page])
      redirect_to "/projects/#{@project.id}", :notice => "Page updated successfully"
    else
      render :action => 'edit'
    end
  end

  def destroy
    @page = Page.find(params[:id])
    @project = @page.project
    if @page.destroy
      redirect_to "/projects/#{@project.id}", :notice => "Page deleted successfully"
    end
  end
end
