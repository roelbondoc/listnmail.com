class ListsController < ApplicationController
  def show
  end

  def new
    @list = List.new(:name => params[:name], :admin_email => params[:email])
  end

  def create
    @list = List.new(params[:list])
    if(@list.save)
      render :show
    else
      render :new
    end
  end
end
