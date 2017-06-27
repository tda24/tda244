class VarietywinesController < ApplicationController
  before_action :set_varietywine, only: [:show, :edit, :update, :destroy]

  # GET /varietywines
  # GET /varietywines.json
  def index
    @varietywines = Varietywine.all
  end

  # GET /varietywines/1
  # GET /varietywines/1.json
  def show
  end

  # GET /varietywines/new
  def new
    @varietywine = Varietywine.new
  end

  # GET /varietywines/1/edit
  def edit
  end

  # POST /varietywines
  # POST /varietywines.json
  def create
    @varietywine = Varietywine.new(varietywine_params)

    respond_to do |format|
      if @varietywine.save
        format.html { redirect_to @varietywine, notice: 'Сорт вина успешно создан.' }
        format.json { render :show, status: :created, location: @varietywine }
      else
        format.html { render :new }
        format.json { render json: @varietywine.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /varietywines/1
  # PATCH/PUT /varietywines/1.json
  def update
    respond_to do |format|
      if @varietywine.update(varietywine_params)
        format.html { redirect_to @varietywine, notice: 'Сорт вина успешно изменен.' }
        format.json { render :show, status: :ok, location: @varietywine }
      else
        format.html { render :edit }
        format.json { render json: @varietywine.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /varietywines/1
  # DELETE /varietywines/1.json
  def destroy
    @varietywine.destroy
    respond_to do |format|
      format.html { redirect_to varietywines_url, notice: 'Сорт вина успешно удален.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_varietywine
      @varietywine = Varietywine.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def varietywine_params
      params.require(:varietywine).permit(:name, :type_of_wine, :color, :aging_in_barrels, :aging_in_bottles,
        {relationships_attributes: [:_destroy, :id, :ratio,
 :grapesort_id, {grapesort_attributes: [:destroy, :id, :name, :place_of_production, :date_of_collection]}
]}
)
    end
end
