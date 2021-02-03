class ClientsController < ApplicationController
  def index
    @clients = Client.all
  end

  def new
    @client = Client.new
  end

  def create
    Client.create!(name: client_params[:name], gender: client_params[:gender], age: client_params[:age], address: client_params[:address])
  end

  private

  def client_params
    params.require(:client).permit(:name, :gender, :age, :address)
  end
end
