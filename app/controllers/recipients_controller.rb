class RecipientsController < ApplicationController
  def new
    @list = List.find(params[:list_id])
    @recipient = @list.recipients.new
  end

  def create
    @list = List.find(params[:list_id])
    @recipient = @list.recipients.new(params[:recipient])
    if(@recipient.save)
      redirect_to new_list_recipient_path(@list)
    else
      render :new
    end
  end

  def destroy
    @list = List.find(params[:list_id])
    @recipient = @list.recipients.find(params[:id])
    @recipient.destroy
    redirect_to new_list_recipient_path(@list)
  end
end
