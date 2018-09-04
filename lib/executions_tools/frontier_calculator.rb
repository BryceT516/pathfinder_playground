module ExecutionsTools
  class FrontierCalculator
    def initialize(execution)
      @execution = execution
      @map = Map.find(@execution.map_id)
      @agent = Agent.find(@execution.agent_id)
    end

    def calculate
      puts "Frontier calc using current x = #{@execution.agent_current_x}, y = #{@execution.agent_current_y}"
      return [{x: @execution.end_point_x, y: @execution.end_point_y}] if can_reach_end_point?

      possible_vertices = []
      frontier = []
      @map.polygons.each do |polygon|
        polygon.get_visible_vertices(x: @execution.agent_current_x, y: @execution.agent_current_y).each do |vertex|
          possible_vertices << {x: vertex[:x], y: vertex[:y]}
        end
      end

      possible_vertices.each do |vertex|
        intersection_exists = false

        @map.polygons.each do |polygon|
          if polygon.check_intersection(origin_x: @execution.agent_current_x,
                                        origin_y: @execution.agent_current_y,
                                        end_x: vertex[:x],
                                        end_y: vertex[:y])
            intersection_exists = true
            break
          end
        end

        frontier << {x: vertex[:x], y: vertex[:y]} unless intersection_exists
      end

      frontier
    end

    private

    def can_reach_end_point?
      puts ("Can_reach_end_point? ...")
      puts ("origin_x = #{@execution.agent_current_x}, origin_y = #{@execution.agent_current_y} to end_x = #{@execution.end_point_x}, end_y = #{@execution.end_point_y}")
      @map.polygons.each do |polygon|
        puts ("Polygon: #{polygon.id}")
        return false if polygon.check_intersection(origin_x: @execution.agent_current_x,
                                                   origin_y: @execution.agent_current_y,
                                                   end_x: @execution.end_point_x,
                                                   end_y: @execution.end_point_y)
      end
      true
    end
  end
end