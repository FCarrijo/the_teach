class AgendaAluno < ApplicationRecord
  belongs_to :aluno
  belongs_to :agenda_professor
  validates_presence_of :aluno_id, message: 'é obrigatório'
  validates_presence_of :agenda_professor_id, message: 'é obrigatória'
  validates :aluno_id, uniqueness: { scope: [:agenda_professor_id],
                                     message: "Já existe uma agenda para este dia e horário" }
end
