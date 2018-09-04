module ArenaApi
  module V1
    class AgentsController < ApplicationController

      def index
        puts '*' * 80
        @agents = Agent.all
        respond_to do |format|
          format.json {
            render :json => @agents.to_json
          }
        end
      end

      def show
        @agent = Agent.find(params[:id])

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