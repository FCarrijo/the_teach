class MunicipiosController < ApplicationController
  before_action :set_municipio, only: %i[ show edit update destroy ]
  load_and_authorize_resource
  # GET /municipios or /municipios.json
  def index
    @municipios = Municipio.eager_load(:estado).all.order("estados.nome, municipios.nome")
  end

  # GET /municipios/1 or /municipios/1.json
  def show
  end

  # GET /municipios/new
  def new
    @municipio = Municipio.new
  end

  # GET /municipios/1/edit
  def edit
  end

  # POST /municipios or /municipios.json
  def create
    @municipio = Municipio.new(municipio_params)

    respond_to do |format|
      if @municipio.save
        format.html { redirect_to municipio_url(@municipio), notice: "Municipio was successfully created." }
        format.json { render :show, status: :created, location: @municipio }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @municipio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /municipios/1 or /municipios/1.json
  def update
    respond_to do |format|
      if @municipio.update(municipio_params)
        format.html { redirect_to municipio_url(@municipio), notice: "Municipio was successfully updated." }
        format.json { render :show, status: :ok, location: @municipio }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @municipio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /municipios/1 or /municipios/1.json
  def destroy
    @municipio.destroy

    respond_to do |format|
      format.html { redirect_to municipios_url, notice: "Municipio was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def autocomplete
    if params[:key]
      results = Municipio.find(params[:key])
    else
      results = Municipio.like(params[:q])
    end
    render json: results.as_json
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_municipio
    @municipio = Municipio.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def municipio_params
    params.require(:municipio).permit(:nome, :estado_id)
  end
end
