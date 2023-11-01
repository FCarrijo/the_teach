json.extract! agenda_aluno, :id, :aluno_id, :agenda_professor_id, :observacao, :created_at, :updated_at
json.url agenda_aluno_url(agenda_aluno, format: :json)
