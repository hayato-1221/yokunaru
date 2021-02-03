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

  private

  def client_params
    params.require(:client).permit(:name, :gender, :age, :address)
  end
end
