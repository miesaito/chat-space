class MessagesController < ApplicationController
  def index
    # binding.pry
    @groups = current_user.groups
    @group = Group.find(params[:group_id])
    @message = Message.new
  end

  def create
    #binding.pry
    @group = Group.find(params[:group_id])
    @message = current_user.messages.new(message_params)
    if @message.save
      redirect_to action: :index
    else
      render :index, alert: 'メッセージを入力してください'
    end
  end

private
  def message_params
    params.require(:message).permit(:text, :image).merge(group_id: params[:group_id])
  end

end
