class ProfessoresController < ApplicationController
  before_action :set_professor, only: %i[ show edit update destroy ]
  load_and_authorize_resource
  # GET /professores or /professores.json
  def index
    @professors = Professor.all
  end

  # GET /professores/1 or /professores/1.json
  def show
  end

  # GET /professores/new
  def new
    @professor = Professor.new
  end

  # GET /professores/1/edit
  def edit
  end

  # POST /professores or /professores.json
  def create
    @professor = Professor.new(professor_params)

    respond_to do |format|
      if @professor.save
        format.html { redirect_to professores_path, notice: "Professor cadastrado com sucesso." }
        format.json { render :show, status: :created, location: @professor }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @professor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /professores/1 or /professores/1.json
  def update
    respond_to do |format|
      if @professor.update(professor_params)
        format.html { redirect_to professores_path, notice: "Professor atualizado com sucesso." }
        format.json { render :show, status: :ok, location: @professor }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @professor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /professores/1 or /professores/1.json
  def destroy
    @professor.destroy

    respond_to do |format|
      format.html { redirect_to professores_path, notice: "Professor excluído com sucesso" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_professor
      @professor = Professor.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def professor_params
      params.require(:professor).permit(:nome, :email)
    end
end
