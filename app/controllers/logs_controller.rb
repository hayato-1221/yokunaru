class LogsController < ApplicationController
  def index
    @logs = Log.all
  end

  def new
    @client = Client.find(params[:client_id])
    @log = Log.new
  end

  def create
    client = Client.find(params[:client_id])
    @log = client.logs.create!(log_params)
  end

  private

  def log_params
    params.require(:log).permit(:date, :fee).merge(client_id: params[:clietn_id])
  end
end
