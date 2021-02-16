class ClientsController < ApplicationController
  def index
    @clients = Client.order(id: :asc)
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
    @client = Client.find(params[:id])
  end

  def update
    client = Client.find(params[:id])
    client.update!(client_params)
  end

  def destroy
    client = Client.find(params[:id])
    client.destroy!
  end

  private

  def client_params
    params.require(:client).permit(:name, :gender, :age, :address)
  end
end
