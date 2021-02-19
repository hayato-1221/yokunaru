class LogsController < ApplicationController
  before_action :set_post, only: %i[index new edit update destroy]

  def index
    @logs = @client.logs.order(:id)
  end

  def new
    @log = Log.new
  end

  def create
    client = current_user.clients.find(params[:client_id])
    @log = client.logs.create!(log_params)
  end

  def edit
    @log = @client.logs.find(params[:id])
  end

  def update
    log = @client.logs.find(params[:id])
    log.update!(log_params)
    redirect_to client_logs_path
  end

  def destroy
    log = @client.logs.find(params[:id])
    log.destroy!
    redirect_to client_logs_path
  end

  private

  def log_params
    params.require(:log).permit(:date, :fee).merge(client_id: params[:client_id])
  end

  def set_post
    @client = current_user.clients.find(params[:client_id])
  end
end
