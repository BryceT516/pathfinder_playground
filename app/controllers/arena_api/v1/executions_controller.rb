require_dependency Rails.root.join('lib', 'executions_tools', 'frontier_calculator.rb').to_s

module ArenaApi
  module V1
    class ExecutionsController < ApplicationController

      def index
        puts '*' * 80
        @executions = Execution.all
        respond_to do |format|
          format.json {
            render :json => @executions.to_json
          }
        end
      end

      def frontier
        puts 'Frontier....'
        @execution = Execution.find(params[:id])

        @frontier_points = ExecutionsTools::FrontierCalculator.new(@execution).calculate
        @frontier_points.each do |point|
          distance_to_goal = get_distance_to_goal(point, @execution)
          cost_to_point = get_cost_to_point(point, @execution)
          total_cost_to_point = @execution.agent_current_cost + cost_to_point

          new_point = @execution.frontier_points.find_or_create_by(x: point[:x], y: point[:y])
          new_point.update_attributes(
              distance_to_goal: distance_to_goal,
              cost: cost_to_point,
              total_cost: total_cost_to_point,
              h_score: total_cost_to_point + distance_to_goal
          )
        end
      end

      def point_in_frontier?(point, execution)
        execution.frontier_points.find_by(x: point[:x], y: point[:y]).present?
      end

      def move_agent
        puts 'Moving agent...'
        @execution = Execution.find(params[:id])

        selected_point = @execution.frontier_points.order(:h_score).first

        @execution.agent_current_x = selected_point.x
        @execution.agent_current_y = selected_point.y
        @execution.agent_current_cost = selected_point.total_cost
        @execution.save
        selected_point.destroy
        puts ("new current agent x = #{@execution.agent_current_x}, y = #{@execution.agent_current_y}")
        @new_location = {x: @execution.agent_current_x, y: @execution.agent_current_y}
      end

      def reset
        @execution = Execution.find(params[:id])
        @map = Map.find(@execution.map_id)

        @execution.agent_current_x = @map.start_point_x
        @execution.agent_current_y = @map.start_point_y
        @execution.agent_current_cost = 0
        @execution.frontier_points.each do |point|
          point.destroy
        end
        @execution.save
      end

      def show
        @execution = Execution.find(params[:id])

      end

      def create
        # respond_with Map.create(params[:map])
      end

      def update
        # respond_with Map.update(params[:id], params[:map])
      end

      def destroy
        # respond_with Map.destroy(params[:id])
      end

      private

      def get_distance_to_goal(point, execution)
        x_distance = point[:x] - execution.map.end_point_x
        y_distance = point[:y] - execution.map.end_point_y

        x_distance_sq = x_distance ** 2
        y_distance_sq = y_distance ** 2

        distance_sq = x_distance_sq + y_distance_sq

        Math.sqrt(distance_sq)
      end

      def get_cost_to_point(point, execution)
        x_distance = point[:x] - execution.agent_current_x
        y_distance = point[:y] - execution.agent_current_y

        x_distance_sq = x_distance ** 2
        y_distance_sq = y_distance ** 2

        distance_sq = x_distance_sq + y_distance_sq

        Math.sqrt(distance_sq)
      end
    end
  end
end

