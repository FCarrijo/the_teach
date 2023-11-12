json.extract! aluno, :id, :nome, :cpf, :email, :dta_nasc, :nome_mae, :nome_pai, :logradouro, :bairro, :municipio_id, :escolaridade_id, :esc_concluida, :created_at, :updated_at
json.url aluno_url(aluno, format: :json)
