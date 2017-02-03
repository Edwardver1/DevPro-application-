class StaticPagesController < ApplicationController
  def home
    @projects = Project.paginate(page: params[:page])
  end

  def help
  end

  def about

  end

  def contact

  end
end
