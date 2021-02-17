class LogsController < ApplicationController
  before_action :set_post

  def index
    @client = Client.find(params[:client_id])
    @logs = Log.order(:id)
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
    params.require(:log).permit(:date, :fee).merge(client_id: params[:clietn_id])
  end

  def set_post
    @log = current_user.logs.find(params[:id])
  end
end
