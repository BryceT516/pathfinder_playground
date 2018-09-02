module ArenaApi
  module V1
    class MapsController < ApplicationController

      def index
        puts '*' * 80
        @maps = Map.all
        respond_to do |format|
          format.json {
            render :json => @maps.to_json
          }
        end
      end

      def show
        @map = Map.find(params[:id])

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
    end
  end
end

