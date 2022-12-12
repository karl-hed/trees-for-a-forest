class MessagesController < ApplicationController
  def index
    @profile = User.find(params[:profile_id])
    @chatroom = Chatroom.where(first_user_id: current_user.id, second_user_id: params[:profile_id])
            .or(Chatroom.where(first_user_id: params[:profile_id], second_user_id: current_user.id))
            .first
    if @chatroom.nil?
      @chatroom = Chatroom.create(first_user_id: current_user.id, second_user_id: params[:profile_id])
    end
    @message = Message.new
    # raise
  end

  def create
    @chatroom = Chatroom.where(first_user_id: current_user.id, second_user_id: params[:profile_id])
            .or(Chatroom.where(first_user_id: params[:profile_id], second_user_id: current_user.id))
            .first
    @message = Message.new(message_params)
    @message.chatroom = @chatroom
    @message.sender = current_user
    if @message.save
      ChatroomChannel.broadcast_to(
        @chatroom,
        message: render_to_string(partial: "message", locals: { message: @message }),
        sender_id: @message.sender.id
      )
      head :ok
    else
      render "messages/show", status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
