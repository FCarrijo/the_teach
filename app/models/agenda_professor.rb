class AgendaProfessor < ApplicationRecord
  belongs_to :professor, class_name: 'Professor', foreign_key: :professor_id
  belongs_to :disciplina, class_name: 'Disciplina', foreign_key: :disciplina_id

  validates_presence_of :professor_id
  validates_presence_of :disciplina_id
  validates_presence_of :dia
  validates_presence_of :horario
  validates :professor_id, uniqueness: { scope: [:disciplina_id, :dia, :horario],
                                         message: "Já existe uma agenda para este dia e horário" }

end
