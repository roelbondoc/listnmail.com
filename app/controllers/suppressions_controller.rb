class SuppressionsController < ApplicationController
  def show
  end

  def new
    @suppression = Suppression.new
  end

  def create
    @suppression = Suppression.new(params[:suppression])
    if(@suppression.save)
      render :show
    else
      render :new
    end
  end
end
