class LogsController < ApplicationController
  def new
    @logs = Log.new
  end

  def create
    Log.create(log_params)
  end

  private

  def log_params
    params.require(:log).permit(:date, :integer)
  end
end
