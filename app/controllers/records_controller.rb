class RecordsController < ApplicationController
  def index
    @records = Record.all
  end

  def new
    @record = Record.new
  end

  def create
    @log = @client.logs.find(params[:log_id])
    @record = @log.records.create!(record_params)
  end

  def show
    @record = Record.find(params[:id])
  end

  def edit
    @record = Record.find(params[:id])
  end

  def update
    record = Record.find(params[:id])
    record.update!
  end

  def destroy
    record = Record.find(params[:id])
    record.destroy!
  end

  private

  def record_params
    params.require(:record).permit(:subjective, :objective, :assessment, :plan, :memo)
  end
end
