class MessagesController < ApplicationController
  
  def index
    @messages = current_user.messages
    render :index
  end
  
  def show
    @message = Message.find(params[:id])
    render :show
  end
  
  def new
    @message = Message.new
    render :new
  end
  
  def create
    @message = Message.new(params[:message])
    
    if @message.save
      redirect_to message_url(@message)
    else
      flash.now[:errors] = @message.errors.full_messages
      render :new
    end
  end
  
  def destroy
    @message = Message.find(params[:id])
    @message.destroy
    redirect_to messages_url
  end
  
end
