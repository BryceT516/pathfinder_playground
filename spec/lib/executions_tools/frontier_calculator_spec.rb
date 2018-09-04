require 'rails_helper'
require Rails.root.join('lib', 'executions_tools', 'frontier_calculator.rb').to_s

RSpec.describe ExecutionsTools::FrontierCalculator do
  let!(:map) {Map.create(description: 'map 1', start_point_x: 5, start_point_y: 5, end_point_x: 6, end_point_y: 1)}
  let!(:polygon_1) {Polygon.create(designation: 'a', map: map, vertex_count: 4)}
  before do
    polygon_1.vertices.create(x: 2, y: 1)
    polygon_1.vertices.create(x: 4, y: 1)
    polygon_1.vertices.create(x: 4, y: 4)
    polygon_1.vertices.create(x: 2, y: 4)
  end
  let!(:polygon_2) {Polygon.create(designation: 'b', map: map, vertex_count: 4)}
  before do
    polygon_2.vertices.create(x: 5, y: 7)
    polygon_2.vertices.create(x: 6, y: 7)
    polygon_2.vertices.create(x: 6, y: 2)
    polygon_2.vertices.create(x: 5, y: 2)
  end
  let!(:agent) {Agent.create(name: 'agent A', description: 'A-star search algorithm.', algorithm: 'A-star')}
  let!(:execution) {Execution.create(map_id: Map.last.id, agent_id: Agent.last.id, agent_current_x: map.start_point_x, agent_current_y: map.start_point_y)}

  subject(:frontier_calculator) { ExecutionsTools::FrontierCalculator.new(execution) }

  describe '#calculate' do
    context 'when the end point can be reached from the agent current position' do
      let(:expected_result) { [{x: map.end_point_x, y: map.end_point_y}] }

      it 'returns an array of hashes with one entry with x and y of the end point' do
        expect(subject.calculate).to eq(expected_result)
      end
    end

    context 'when the end point cannot be reached from the agent current position' do
      context 'when vertices from one polygon are reachable' do
        let(:expected_result) { [{x: 2, y: 1}, {x: 2, y: 4}] }

        before do
          execution.update_attributes(agent_current_x: 1, agent_current_y: 2)
        end

        it 'returns an array of hashes with entries for each reachable vertex' do
          expect(subject.calculate).to eq(expected_result)
        end
      end

      context 'when vertices from two polygons are reachable' do
        let(:expected_result) { [{x: 2, y: 1}, {x: 4, y: 4}, {x: 2, y: 4}, {x: 5, y: 7}] }

        before do
          execution.update_attributes(agent_current_x: 1, agent_current_y: 4)
        end

        it 'returns an array of hashes with entries for each reachable vertex' do
          expect(subject.calculate).to eq(expected_result)
        end
      end
    end
  end
end