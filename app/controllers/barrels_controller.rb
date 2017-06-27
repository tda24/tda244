class BarrelsController < ApplicationController
  before_action :set_barrel, only: [:show, :edit, :update, :destroy]
 def search
    if params.has_key?('search')
      @barrels = Barrel.search(params['search'])
    else
      @barrels = []
    end
    params['search'] ||= {}
    @old_is_empty=params.has_key?('search') ? params[:search][:is_empty] : ""
    @old_type_of_wine=params.has_key?('search') ? params[:search][:type_of_wine] : ""

end
  # GET /barrels
  # GET /barrels.json
  def index
    @barrels = Barrel.all
  end

  # GET /barrels/1
  # GET /barrels/1.json
  def show
  end

  # GET /barrels/new
  def new
    @barrel = Barrel.new
  end

  # GET /barrels/1/edit
  def edit
  end

  # POST /barrels
  # POST /barrels.json
  def create
    @barrel = Barrel.new(barrel_params)

    respond_to do |format|
      if @barrel.save
        format.html { redirect_to @barrel, notice: 'Бочка успешно создана.' }
        format.json { render :show, status: :created, location: @barrel }
      else
        format.html { render :new }
        format.json { render json: @barrel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /barrels/1
  # PATCH/PUT /barrels/1.json
  def update
    respond_to do |format|
      if @barrel.update(barrel_params)
        format.html { redirect_to @barrel, notice: 'Бочка успешно обновлена.' }
        format.json { render :show, status: :ok, location: @barrel }
      else
        format.html { render :edit }
        format.json { render json: @barrel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /barrels/1
  # DELETE /barrels/1.json
  def destroy
    @barrel.destroy
    respond_to do |format|
      format.html { redirect_to barrels_url, notice: 'Бочка успешно удалена.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_barrel
      @barrel = Barrel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def barrel_params
      params.require(:barrel).permit(:location, :date_of_manufacture, :amount, :is_empty, :date_of_filling, :varietywine_id,
        {varietywine_attributes:[:_destroy, :id, :name, :type_of_wine, :color, :aging_in_barrels, :aging_in_bottles]})
    end
end
