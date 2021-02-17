class LogsController < ApplicationController
  def index
    @client = Client.find(params[:client_id])
    @logs = Client.find(params[:client_id]).logs
  end

  def new
    @client = Client.find(params[:client_id])
    @log = Log.new
  end

  def create
    client = Client.find(params[:client_id])
    @log = client.logs.create!(log_params)
  end

  def edit
    @log = Log.find(params[:id])
  end

  def update
    log = Log.find(params[:id])
    log.update!(log_params)
  end

  def destroy
    log = Log.find(params[:id])
    log.destroy!
  end

  private

  def log_params
    params.require(:log).permit(:date, :fee).merge(client_id: params[:client_id])
  end
end
