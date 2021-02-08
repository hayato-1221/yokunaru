class LogsController < ApplicationController
  def new
    @logs = Log.new
  end

  def create
    log = log.create!(log_params)
    redirect_to log
  end

  private

  def log_params
    params.require(:log).permit(:date, :integer)
  end
end
