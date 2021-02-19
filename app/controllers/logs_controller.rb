class LogsController < ApplicationController
  before_action :set_post only: %i[index new edit update destroy]
  def index
    @client = current_user.clients.find(params[:client_id])
    @logs = @client.logs.order(:id)
  end

  def new
    @client = current_user.clients.find(params[:client_id])
    @log = Log.new
  end

  def create
    client = current_user.clients.find(params[:client_id])
    @log = client.logs.create!(log_params)
  end

  def edit
    @client = current_user.clients.find(params[:client_id])
    @log = Log.find(params[:id])
  end

  def update
    @client = current_user.clients.find(params[:client_id])
    log = @client.logs.find(params[:id])
    log.update!(log_params)
    redirect_to client_logs_path
  end

  def destroy
    @client = current_user.clients.find(params[:client_id])
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
