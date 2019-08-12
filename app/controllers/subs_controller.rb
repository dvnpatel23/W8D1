class SubsController < ApplicationController
  before_action :require_logged_in
  before_action :moderators_only, only:[:edit, :update]

  def moderators_only
    if current_user.subs.find(params[:id]).nil?
      redirect_to sub_url(params[:id])
    end 
  end

  def new
    @sub = Sub.new
  end

  def create
    @sub = Sub.new(sub_params)
    @sub.user_id = current_user.id
    if @sub.save
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :new
    end
  end

  def edit
    @sub = Sub.find(params[:id])
  end

  def update
    @sub = current_user.subs.find(params[:id])

    if @sub.update(sub_params)
      redirect_to sub_link(@sub)
    else 
      flash.now[:errors] = @sub.errors.full_messages
      render :edit
    end
  end

  def show
    @sub = Sub.find(params[:id])
  end
  
  private
  
  def sub_params
    params.require(:sub).permit(:title, :description)
  end
end
