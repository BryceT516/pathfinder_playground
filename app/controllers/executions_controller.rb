class ExecutionsController < ApplicationController
  before_action :set_execution

  def index

  end

  def show
    @map = Map.find(@execution.map_id)
    @agent = Agent.find(@execution.agent_id)
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_execution
    @execution = Execution.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def execution_params
    params.permit(:id)
  end

end