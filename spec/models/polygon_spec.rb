require 'rails_helper'

RSpec.describe Polygon, type: :model do
  let(:map) {Map.create(description: 'map 1', start_point_x: 115, start_point_y: 655, end_point_x: 380, end_point_y: 560)}
  let!(:polygon_1) {Polygon.create(designation: 'a', map: map, vertex_count: 4)}
  before do
    polygon_1.vertices.create(x: 2, y: 1)
    polygon_1.vertices.create(x: 4, y: 1)
    polygon_1.vertices.create(x: 4, y: 4)
    polygon_1.vertices.create(x: 2, y: 4)
  end

  subject(:polygon) {Polygon.last}

  describe '#check_instersection' do
    context 'when the line intersects a line in the polygon' do
      let(:line) {{origin_x: 1, origin_y: 1, end_x: 3, end_y: 3}}

      it 'returns true' do
        expect(polygon.check_intersection(origin_x: line[:origin_x], origin_y: line[:origin_y], end_x: line[:end_x], end_y: line[:end_y])).to eq(true)
      end
    end

    context 'when the line does not intersect the polygon' do
      let(:line) {{origin_x: 1, origin_y: 1, end_x: 1, end_y: 4}}

      it 'returns false' do
        expect(polygon.check_intersection(origin_x: line[:origin_x], origin_y: line[:origin_y], end_x: line[:end_x], end_y: line[:end_y])).to eq(false)
      end
    end

    context 'when the origin point of the line matches a vertex' do
      context 'and the end point of the line is outside the polygon through the polygon' do
        let(:line) {{origin_x: 2, origin_y: 1, end_x: 1, end_y: 3}}

        it 'returns false' do
          expect(polygon.check_intersection(origin_x: line[:origin_x], origin_y: line[:origin_y], end_x: line[:end_x], end_y: line[:end_y])).to eq(false)
        end
      end

      context 'and the end point of the line is outside the polygon without going through the polygon' do
        let(:line) {{origin_x: 2, origin_y: 1, end_x: 5, end_y: 5}}

        it 'returns true' do
          expect(polygon.check_intersection(origin_x: line[:origin_x], origin_y: line[:origin_y], end_x: line[:end_x], end_y: line[:end_y])).to eq(true)
        end
      end

      context 'and the end point of the line is an adjacent vertex of the polygon' do
        let(:line) {{origin_x: 2, origin_y: 1, end_x: 4, end_y: 1}}

        it 'returns false' do
          expect(polygon.check_intersection(origin_x: line[:origin_x], origin_y: line[:origin_y], end_x: line[:end_x], end_y: line[:end_y])).to eq(false)
        end
      end

      context 'and the end point of the line is another vertex of the polygon' do
        context 'and the line goes through the polygon' do
          let(:line) {{origin_x: 2, origin_y: 1, end_x: 4, end_y: 4}}

          it 'returns true' do
            expect(polygon.check_intersection(origin_x: line[:origin_x], origin_y: line[:origin_y], end_x: line[:end_x], end_y: line[:end_y])).to eq(true)
          end
        end
      end
    end

    context 'when the end point of the line matches a vertex' do
      context 'and the line passes through the polygon' do
        let(:line) {{origin_x: 1, origin_y: 5, end_x: 4, end_y: 1}}

        it 'returns true' do
          expect(polygon.check_intersection(origin_x: line[:origin_x], origin_y: line[:origin_y], end_x: line[:end_x], end_y: line[:end_y])).to eq(true)
        end
      end

      context 'and the line does not pass through the polygon' do
        let(:line) {{origin_x: 1, origin_y: 5, end_x: 4, end_y: 4}}

        it 'returns false' do
          expect(polygon.check_intersection(origin_x: line[:origin_x], origin_y: line[:origin_y], end_x: line[:end_x], end_y: line[:end_y])).to eq(false)
        end
      end
    end
  end

  describe '#get_visible_vertices' do
    context 'when the point is not a vertex of the polygon' do
      let(:point) { {x: 1, y: 5} }
      let(:expected_vertices) { [{x: 2, y: 1}, {x:4, y: 4}, {x: 2, y: 4}] }

      it 'returns the correct list of vertices' do
        expect(subject.get_visible_vertices(x: point[:x], y: point[:y])).to eq(expected_vertices)
      end
    end

    context 'when the point is a vertex of the polygon' do
      let(:point) { {x: 4, y: 1} }
      let(:expected_vertices) { [{x: 2, y: 1}, {x:4, y: 4}] }

      it 'returns the correct list of vertices' do
        expect(subject.get_visible_vertices(x: point[:x], y: point[:y])).to eq(expected_vertices)
      end
    end
  end
end
