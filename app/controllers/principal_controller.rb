class PrincipalController < ApplicationController

  # GET /estados or /estados.json
  def index
    session[:aluno_id] = Aluno.find_by(user_id: current_user)&.id
  end

end
