class InteresseAlunosController < ApplicationController
  before_action :set_interesse_aluno, only: %i[ show edit update destroy ]
  load_and_authorize_resource
  # GET /interesse_alunos or /interesse_alunos.json
  def index
    @interesse_alunos = InteresseAluno.all
  end

  # GET /interesse_alunos/1 or /interesse_alunos/1.json
  def show
  end

  # GET /interesse_alunos/new
  def new
    @interesse_aluno = InteresseAluno.new
  end

  # GET /interesse_alunos/1/edit
  def edit
  end

  # POST /interesse_alunos or /interesse_alunos.json
  def create
    @interesse_aluno = InteresseAluno.new(interesse_aluno_params)

    respond_to do |format|
      if @interesse_aluno.save
        format.html { redirect_to interesse_aluno_url(@interesse_aluno), notice: "Interesse aluno was successfully created." }
        format.json { render :show, status: :created, location: @interesse_aluno }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @interesse_aluno.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /interesse_alunos/1 or /interesse_alunos/1.json
  def update
    respond_to do |format|
      if @interesse_aluno.update(interesse_aluno_params)
        format.html { redirect_to interesse_aluno_url(@interesse_aluno), notice: "Interesse aluno was successfully updated." }
        format.json { render :show, status: :ok, location: @interesse_aluno }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @interesse_aluno.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /interesse_alunos/1 or /interesse_alunos/1.json
  def destroy
    @interesse_aluno.destroy

    respond_to do |format|
      format.html { redirect_to interesse_alunos_url, notice: "Interesse aluno was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_interesse_aluno
      @interesse_aluno = InteresseAluno.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def interesse_aluno_params
      params.require(:interesse_aluno).permit(:aluno_id, :area_id)
    end
end
