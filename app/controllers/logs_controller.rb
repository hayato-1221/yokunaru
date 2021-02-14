class LogsController < ApplicationController
  def index
    @logs = Log.all
  end

  def new
    @log = Log.new
  end

  def create
    client = Client.find(current_user.id)
    @log = client.logs.create!(log_params)
  end

  private

  def log_params
    params.require(:log).permit(:date, :fee).merge(client_id: params[:client_id])
  end
end
