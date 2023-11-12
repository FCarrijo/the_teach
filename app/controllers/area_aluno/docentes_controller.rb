class AreaAluno::DocentesController < ApplicationController
  before_action :set_professor, only: %i[ show edit update destroy ]
  # GET /professores or /professores.json
  def index
    @professors = Professor.all
  end

  # GET /professores/1 or /professores/1.json
  def show
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
