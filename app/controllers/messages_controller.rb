class MessagesController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :create

  def create
    @message = Message.create! message_params
  end

  private

  def message_params
    params.require(:message).permit(:name, :email, :subject, :message)
  end
end
