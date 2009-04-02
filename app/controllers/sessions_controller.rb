class SessionsController < ApplicationController
  skip_before_filter :find_product
  layout false
  
  def new
    render
  end
  
  def create
    @session = Session.new(params[:session])
    if @session.save
      flash[:notice] = "Login successful!"
      redirect_to root_url(:host => product_url(params[:product]))
    else
      flash[:notice] = "Login failed!"
      render :action => :new
    end
  end
  
  def destroy
    current_session.destroy
    flash[:notice] = "Logout successful!"
    redirect_back_or_default new_session_url
  end
end
