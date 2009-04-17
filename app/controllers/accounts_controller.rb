class AccountsController < ApplicationController
  public_facing
  
  def create
    if Account.create(params[:account])
      Product.create! :name => params[:product]
      redirect_to root_url(:host => product_url(params[:product]))
    else
      flash[:notice] = "Account not created"
      render :action => :new
    end
  end
end
