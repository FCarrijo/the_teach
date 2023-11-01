class EscolaridadesController < ApplicationController
  before_action :set_escolaridade, only: %i[ show edit update destroy ]

  # GET /escolaridades or /escolaridades.json
  def index
    @escolaridades = Escolaridade.all
  end

  # GET /escolaridades/1 or /escolaridades/1.json
  def show
  end

  # GET /escolaridades/new
  def new
    @escolaridade = Escolaridade.new
  end

  # GET /escolaridades/1/edit
  def edit
  end

  # POST /escolaridades or /escolaridades.json
  def create
    @escolaridade = Escolaridade.new(escolaridade_params)

    respond_to do |format|
      if @escolaridade.save
        format.html { redirect_to escolaridade_url(@escolaridade), notice: "Escolaridade was successfully created." }
        format.json { render :show, status: :created, location: @escolaridade }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @escolaridade.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /escolaridades/1 or /escolaridades/1.json
  def update
    respond_to do |format|
      if @escolaridade.update(escolaridade_params)
        format.html { redirect_to escolaridade_url(@escolaridade), notice: "Escolaridade was successfully updated." }
        format.json { render :show, status: :ok, location: @escolaridade }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @escolaridade.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /escolaridades/1 or /escolaridades/1.json
  def destroy
    @escolaridade.destroy

    respond_to do |format|
      format.html { redirect_to escolaridades_url, notice: "Escolaridade was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_escolaridade
      @escolaridade = Escolaridade.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def escolaridade_params
      params.require(:escolaridade).permit(:nome)
    end
end
