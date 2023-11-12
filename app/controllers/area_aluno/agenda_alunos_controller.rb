class AreaAluno::AgendaAlunosController < ApplicationController
  before_action :set_agenda_aluno, only: %i[ show edit update destroy ]
  # GET /agenda_alunos or /agenda_alunos.json
  def index
    aluno_id = session[:aluno_id]
    aluno_id = Aluno.find_by(user_id: current_user).id unless aluno_id.present?
    @agenda_alunos = AgendaAluno.where(aluno_id: aluno_id)
  end

  # GET /agenda_alunos/1 or /agenda_alunos/1.json
  def show
  end

  # GET /agenda_alunos/new
  def new
    @agenda_aluno = AgendaAluno.new(aluno_id: Aluno.find_by(user_id: current_user).id)
  end

  # GET /agenda_alunos/1/edit
  def edit
  end

  # POST /agenda_alunos or /agenda_alunos.json
  def create
    @agenda_aluno = AgendaAluno.new(agenda_aluno_params)

    respond_to do |format|
      if @agenda_aluno.save
        format.html { redirect_to area_aluno_agenda_alunos_path, notice: "Agenda do aluno criada com sucesso." }
        format.json { render :show, status: :created, location: @agenda_aluno }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @agenda_aluno.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /agenda_alunos/1 or /agenda_alunos/1.json
  def update
    respond_to do |format|
      if @agenda_aluno.update(agenda_aluno_params)
        format.html { redirect_to area_aluno_agenda_alunos_path, notice: "Agenda do aluno alterada com sucesso." }
        format.json { render :show, status: :ok, location: @agenda_aluno }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @agenda_aluno.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /agenda_alunos/1 or /agenda_alunos/1.json
  def destroy
    @agenda_aluno.destroy

    respond_to do |format|
      format.html { redirect_to area_aluno_agenda_alunos_path, notice: "Agenda do aluno excluída com sucesso." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_agenda_aluno
    @agenda_aluno = AgendaAluno.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def agenda_aluno_params
    params.require(:agenda_aluno).permit(:aluno_id, :agenda_professor_id, :observacao)
  end
end
