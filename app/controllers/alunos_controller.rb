class AlunosController < ApplicationController
  before_action :set_aluno, only: %i[ show edit update destroy ]
  load_and_authorize_resource
  # GET /area_aluno or /area_aluno.json
  def index
    @alunos = Aluno.all
  end

  # GET /area_aluno/1 or /area_aluno/1.json
  def show
  end

  # GET /area_aluno/new
  def new
    @aluno = Aluno.new
  end

  # GET /area_aluno/1/edit
  def edit
  end

  # POST /area_aluno or /area_aluno.json
  def create
    @aluno = Aluno.new(aluno_params)

    respond_to do |format|
      user = User.where(email: @aluno.email).first_or_create(name: @aluno.nome, password: '1234')
      if user.present?
        @aluno.user_id = user.id
        if @aluno.save
          format.html { redirect_to alunos_path, notice: "Aluno cadastrado com sucesso." }
          format.json { render :show, status: :created, location: @aluno }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @aluno.errors, status: :unprocessable_entity }
        end
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @aluno.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /area_aluno/1 or /area_aluno/1.json
  def update
    respond_to do |format|
      if @aluno.update(aluno_params)
        format.html { redirect_to alunos_path, notice: "Aluno alterado com sucesso." }
        format.json { render :show, status: :ok, location: @aluno }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @aluno.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /area_aluno/1 or /area_aluno/1.json
  def destroy
    @aluno.destroy
    respond_to do |format|
      format.html { redirect_to alunos_url, notice: "Aluno excluído com sucesso." }
      format.json { head :no_content }
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
