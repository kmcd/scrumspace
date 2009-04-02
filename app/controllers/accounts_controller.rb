class AccountsController < ApplicationController
  skip_before_filter :find_product
  
  layout false
  
  def new
    render
  end
  
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
