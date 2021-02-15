class LogsController < ApplicationController
  def index
    @logs = Log.all
  end

  def new
    @log = Log.new
  end

  def create
    client = Client.find(params[:id])
    @log = client.logs.create!(log_params)
  end

  private

  def log_params
    params.require(:log).permit(:date, :fee)
  end
end
