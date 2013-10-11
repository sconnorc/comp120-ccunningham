class MessagesController < ApplicationController
  protect_from_forgery except: :create	

  def index
  	if params[:id]
      @newMessages = Message.where("id > ?", params[:id])
  		render "update"
  	else
  		@messages = Message.all
  		render "index"
  	end
  end

  def create
	@message = Message.new(message_params)
	if @message.save
      render :nothing => true
  	else
  	  render :nothing => true
  	end
  end

  def show
  	@message = Message.find(params[:id])
  end

  private

  def message_params
  	params.require(:message).permit(:app_id, :content, :username)
  end
end
