class ClientsController < ApplicationController
  def index
    @clients = Client.order(:id)
  end
end
