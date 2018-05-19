class MessagesController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :create

  def create
    @message = Message.new message_params

    respond_to do |format|
      if @message.save
        format.js
      else
        format.js
      end
    end
  end

  private

  def message_params
    params.require(:message).permit(:name, :email, :subject, :message)
  end
end
