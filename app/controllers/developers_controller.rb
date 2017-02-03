class DevelopersController < ApplicationController
  before_action :logged_in_user
  before_action :correct_user,   only: :destroy

  def index
    @developers = Developer.paginate(page: params[:page])
  end

  def show
    @developer = Developer.find(params[:id])
    @projects_assigned = Developer.includes(:projects).find(params[:id])
  end

  def new
    @developer = Developer.new
  end


  def create
    @developer = Developer.new(developer_params)
    if @developer.save
      flash[:success] = "Developer created!"
      redirect_to @developer
    else
      render 'new'
    end
  end

  def destroy
    @developer.destroy
    flash[:success] = "Developer deleted"
    redirect_to request.referrer || root_url
  end


  private

  def developer_params
    params.require(:developer).permit(:name , :surname)
  end

  def correct_user
    @developer = Developer.find(params[:id])
    redirect_to root_url if @developer.nil?
  end


end
