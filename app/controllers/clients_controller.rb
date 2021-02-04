class ClientsController < ApplicationController
  def index
    @clients = Client.all
  end

  def new
    @client = Client.new
  end

  def create
    client = current_user.clients.create!(client_params)
  end

  def edit
    @client = Client.find(params[:id])
  end

  def updated
    @client = Client.find(params[:id])
    client.update!(client_params)
    redirect_to client
  end

  private

  def client_params
    params.require(:client).permit(:name, :gender, :age, :address)
  end
end
