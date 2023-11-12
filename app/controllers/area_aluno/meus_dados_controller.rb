class AreaAluno::MeusDadosController < ApplicationController
  before_action :set_aluno, only: %i[  update  ]
  # GET /area_aluno or /area_aluno.json
  def index
    aluno_id = session[:aluno_id]
    aluno_id = Aluno.find_by(user_id: current_user).id unless aluno_id.present?
    @aluno = Aluno.find(aluno_id)
  end

  # GET /area_aluno/1/edit
  def edit
  end

  # PATCH/PUT /area_aluno/1 or /area_aluno/1.json
  def update
    respond_to do |format|
      if @aluno.update(aluno_params)
        format.html { redirect_to area_aluno_meus_dados_path, notice: "Aluno alterado com sucesso." }
      else
        format.html { render :index, status: :unprocessable_entity }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_aluno
    @aluno = Aluno.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def aluno_params
    params.require(:aluno).permit(:nome, :cpf, :email, :dta_nasc, :nome_mae, :nome_pai, :cep, :contato, :user_id,
                                  :logradouro, :bairro, :municipio_id, :escolaridade_id, :esc_concluida)
  end
end
