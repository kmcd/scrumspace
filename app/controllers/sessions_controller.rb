class SessionsController < ApplicationController
  public_facing
  
  def new
    render
  end
  
  def create
    @session = Session.new(params[:session])
    if @session.save
      redirect_to features_url
    else
      flash[:notice] = "login failed"
      render :action => :new
    end
  end
end
