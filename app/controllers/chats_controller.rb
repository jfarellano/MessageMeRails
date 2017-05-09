class ChatsController < ApplicationController
  before_action :set_chat, only: [:show, :update, :destroy]
  before_action :set_user, only: [:index, :create]
  before_action :set_friend, only: [:create] 

  # GET /chats
  def index
    @chat = @User.chats
    render json: @chat

  end

  # GET /chats/1
  def show
    render json: @chat
  end

  # POST /chats
  def create
    @chat = Chat.new()
    if @chat.save
      @User.chats << @chat
      @Friend.chats << @chat
      render json: @chat
    else
      render json: @chat.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /chats/1
  def update
    if @chat.update()
      render json: @chat
    else
      render json: @chat.errors, status: :unprocessable_entity
    end
  end

  # DELETE /chats/1
  def destroy
    @chat.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chat
      @chat = Chat.find(params[:id])
    end

    def set_user
      @User = User.find(params[:user_id])
    end

    def set_friend
      @Friend = User.find(params.permit(:friend_id)[:friend_id])
    end
end
