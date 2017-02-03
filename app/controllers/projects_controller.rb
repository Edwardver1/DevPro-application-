class ProjectsController < ApplicationController
  before_action :logged_in_user
  before_action :correct_user,   only: :destroy

  def index
    @projects = Project.paginate(page: params[:page])
  end

  def show
    @project = Project.find(params[:id])
    @developer_assigned = Project.includes(:developers).find(params[:id])
  end

  def new
    @project = Project.new
  end


  def create
    @project = Project.new(project_params)
    if @project.save
      flash[:success] = "Project created!"
      redirect_to @project
    else
      render 'new'
    end
  end

  def destroy
    @project.destroy
    flash[:success] = "Project deleted"
    redirect_to request.referrer || root_url
  end


  private

  def project_params
    params.require(:project).permit(:name , :description)
  end

  def correct_user
    @project = Project.find(params[:id])
    redirect_to root_url if @project.nil?
  end

end
