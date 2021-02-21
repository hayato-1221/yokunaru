class RecordsController < ApplicationController
  def index
    @records = Record.all
  end

  def new
    @record = Record.new
  end

  def create
    log = @log.find(params[:id])
    @record = log.records.create!(record_params)
  end

  private

  def record_params
    params.require(:record).permit(:subjective, :objective, :assessment, :plan, :memo)
  end
end
