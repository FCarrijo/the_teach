class AgendaProfessoresController < ApplicationController
  before_action :set_agenda_professor, only: %i[ show edit update destroy ]

  # GET /agenda_professores or /agenda_professores.json
  def index
    @agenda_professores = AgendaProfessor.all
  end

  # GET /agenda_professores/1 or /agenda_professores/1.json
  def show
  end

  # GET /agenda_professores/new
  def new
    @agenda_professor = AgendaProfessor.new
  end

  # GET /agenda_professores/1/edit
  def edit
  end

  # POST /agenda_professores or /agenda_professores.json
  def create
    @agenda_professor = AgendaProfessor.new(agenda_professor_params)

    respond_to do |format|
      if @agenda_professor.save
        format.html { redirect_to agenda_professores_path, notice: "Agenda do professor criada com sucesso." }
        format.json { render :show, status: :created, location: @agenda_professor }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @agenda_professor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /agenda_professores/1 or /agenda_professores/1.json
  def update
    respond_to do |format|
      if @agenda_professor.update(agenda_professor_params)
        format.html { redirect_to agenda_professores_path, notice: "AAgenda do professor alterada com sucesso." }
        format.json { render :show, status: :ok, location: @agenda_professor }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @agenda_professor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /agenda_professores/1 or /agenda_professores/1.json
  def destroy
    @agenda_professor.destroy

    respond_to do |format|
      format.html { redirect_to agenda_professores_path, notice: "Agenda do professor excluída com sucesso." }
      format.json { head :no_content }
    end
  end

  def busca_professores_disciplina
    lista_agendas = AgendaProfessor.joins(:professor, :disciplina).where(disciplina_id: params[:disciplina_id]).map { |x| { id: x.id, descricao: "#{x.professor.nome.upcase} - Disciplina: #{e.disciplina.nome} - Data: #{x.dia.to_s_br} (#{x.horario})" } }
    respond_to do |format|
      format.json { render json: lista_agendas }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_agenda_professor
    @agenda_professor = AgendaProfessor.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def agenda_professor_params
    params.require(:agenda_professor).permit(:dia, :professor_id, :disciplina_id, :horario)
  end
end
