class GrapesortsController < ApplicationController
  before_action :set_grapesort, only: [:show, :edit, :update, :destroy]

  # GET /grapesorts
  # GET /grapesorts.json
  def index
    @grapesorts = Grapesort.all
  end

  # GET /grapesorts/1
  # GET /grapesorts/1.json
  def show
  end

  # GET /grapesorts/new
  def new
    @grapesort = Grapesort.new
  end

  # GET /grapesorts/1/edit
  def edit
  end

  # POST /grapesorts
  # POST /grapesorts.json
  def create
    @grapesort = Grapesort.new(grapesort_params)

    respond_to do |format|
      if @grapesort.save
        format.html { redirect_to @grapesort, notice: 'Grapesort was successfully created.' }
        format.json { render :show, status: :created, location: @grapesort }
      else
        format.html { render :new }
        format.json { render json: @grapesort.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /grapesorts/1
  # PATCH/PUT /grapesorts/1.json
  def update
    respond_to do |format|
      if @grapesort.update(grapesort_params)
        format.html { redirect_to @grapesort, notice: 'Grapesort was successfully updated.' }
        format.json { render :show, status: :ok, location: @grapesort }
      else
        format.html { render :edit }
        format.json { render json: @grapesort.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /grapesorts/1
  # DELETE /grapesorts/1.json
  def destroy
    @grapesort.destroy
    respond_to do |format|
      format.html { redirect_to grapesorts_url, notice: 'Grapesort was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_grapesort
      @grapesort = Grapesort.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def grapesort_params
      params.require(:grapesort).permit(:name, :place_of_production, :date_of_collection)
    end
end
