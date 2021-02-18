class LogsController < ApplicationController
  def index
    @client = Client.find(params[:client_id])
    @logs = @client.logs.order(:id)
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
    @client = Client.find(params[:client_id])
    @log = Log.find(params[:id])
  end

  def update
    log = Log.find(params[:id])
    log.update!(log_params)
    redirect_to client_logs_path
  end

  def destroy
    log = Log.find(params[:id])
    log.destroy!
    redirect_to client_logs_path
  end

  private

  def log_params
    params.require(:log).permit(:date, :fee).merge(client_id: params[:client_id])
  end
end
