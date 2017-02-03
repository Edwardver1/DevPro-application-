class AssignsController < ApplicationController
  before_action :logged_in_user
  before_action :correct_user,   only: :destroy

  def index
    @assigns = Assign.paginate(page: params[:page])
  end

  def show
    @assign = Assign.find(params[:id])
  end

  def new
    @assign = Assign.new
  end


  def create
    @assign = Assign.new(assign_params)
    if @assign.save
      flash[:success] = "Assign created!"
      redirect_to @assign.project
    else
      render 'new'
    end
  end



  def destroy
    @assign.destroy
    flash[:success] = "Assign deleted"
    redirect_to request.referrer || root_url
  end

  def delete_developerAssign
    @developer_assign =  Assign.where("developer_id = ? AND project_id = ?", params[:developer] , params[:project ]  ).first
    Assign.destroy(@developer_assign.id)
    flash[:success] = "Developer deleted from Project"
    redirect_to request.referrer || root_url
  end



  private

  def assign_params
    params.require(:assign).permit(:project_id , :developer_id)
  end

  def correct_user
    @assign = Assign.find(params[:id])
    redirect_to root_url if @assign.nil?
  end

end
