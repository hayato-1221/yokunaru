class ClientsController < ApplicationController
  before_action :set_post, only: %i[edit update destroy]

  def index
    @clients = current_user.clients.order(:id)
  end

  def new
    @client = Client.new
  end

  def create
    client = current_user.clients.create!(client_params)
  end

  def show
    @client = Client.find(params[:id])
    @logs = Log.all
  end

  def edit
  end

  def update
    @client.update!(client_params)
  end

  def destroy
    @client.destroy!
  end

  private

  def client_params
    params.require(:client).permit(:name, :gender, :age, :address)
  end

  def set_post
    @client = current_user.clients.find(params[:id])
  end
end
