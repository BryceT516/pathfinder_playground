class PolygonsController < ApplicationController
  before_action :set_polygon, only: [:show, :edit, :update, :destroy]
  before_action :load_map

  # GET /polygons
  # GET /polygons.json
  def index
    @polygons = @map.polygons.all
  end

  # GET /polygons/1
  # GET /polygons/1.json
  def show
  end

  # GET /polygons/new
  def new
    @polygon = Polygon.new
  end

  # GET /polygons/1/edit
  def edit
  end

  # POST /polygons
  # POST /polygons.json
  def create
    @polygon = Polygon.new(polygon_params)

    respond_to do |format|
      if @polygon.save
        format.html { redirect_to @polygon, notice: 'Polygon was successfully created.' }
        format.json { render :show, status: :created, location: @polygon }
      else
        format.html { render :new }
        format.json { render json: @polygon.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /polygons/1
  # PATCH/PUT /polygons/1.json
  def update
    respond_to do |format|
      if @polygon.update(polygon_params)
        format.html { redirect_to @polygon, notice: 'Polygon was successfully updated.' }
        format.json { render :show, status: :ok, location: @polygon }
      else
        format.html { render :edit }
        format.json { render json: @polygon.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /polygons/1
  # DELETE /polygons/1.json
  def destroy
    @polygon.destroy
    respond_to do |format|
      format.html { redirect_to polygons_url, notice: 'Polygon was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_polygon
      @polygon = Polygon.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def polygon_params
      params.fetch(:polygon, :map_id)
    end

    def load_map
      @map = Map.find(params[:map_id])
    end
end
