class Municipio < ApplicationRecord
  validates_presence_of :nome, message: 'não pode ficar em branco'
  belongs_to :estado

  # Scope para consulta
  scope :like, -> (value) do
    where(<<-SQL.squish, q: "%#{value.upcase}%").order(:nome).limit(TOTAL_REGISTROS)
       upper(nome) like upper(:q)
    SQL
  end
end
