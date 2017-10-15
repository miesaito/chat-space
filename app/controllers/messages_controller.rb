class MessagesController < ApplicationController
  def index
    @groups = current_user.groups
    @group = Group.find(params[:group_id])
    @message = Message.new
  end

  def create
    @group = Group.find(params[:group_id])
    @message = current_user.messages.new(message_params)
    @groups = current_user.groups
    if @message.save
      redirect_to action: :index
    else
      flash[:alert] = 'メッセージを入力してください'
      render :index
    end
  end

private
  def message_params
    params.require(:message).permit(:text, :image).merge(group_id: params[:group_id])
  end
end
