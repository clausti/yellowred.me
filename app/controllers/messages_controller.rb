class MessagesController < ApplicationController
  
  def index
    @messages = current_user.messages
    render :json => @messages.sort { |el1, el2| el2.created_at <=> el1.created_at }, :status => 200
  end
  
  def show
    @message = Message.find(params[:id])
    render :json => @message, :status => 200
  end
  
  def create
    recipient = User.find_by_username(params[:message][:recipient])
    message_params = { :sender_id => current_user.id, 
                       :recipient_id => recipient.id,
                       :body => params[:message][:body] }
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
