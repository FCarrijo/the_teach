class Aluno < ApplicationRecord
  validates_presence_of :nome, message: 'não pode ficar em branco'
  validates_presence_of :cpf, message: 'não pode ficar em branco'
  validates_presence_of :dta_nasc, message: 'não pode ficar em branco'

  validates_uniqueness_of :cpf, message: 'deve ser único'
  belongs_to :municipio
  belongs_to :escolaridade
  belongs_to :user, class_name: 'User', foreign_key: :user_id
end