class MessagesController < ApplicationController
  
  def index
    @messages = current_user.messages
    render :json => @messages, :status => 200
  end
  
  def show
    @message = Message.find(params[:id])
    render :json => @message, :status => 200
  end
  
  def create
    message_params = params[:message].merge(:sender_id => current_user.id)
    @message = Message.new(message_params)
    
    if @message.save
      render :json => @message, :status => 200
    else
      render :json => @message.errrors.full_messages, :status => 422
    end
  end
  
  def destroy
    @message = Message.find(params[:id])
    if @message.destroy
      render :json => true, :status => 200
    else
      render :json => @message.errrors.full_messages, :status => 422
    end
  end
  
end
