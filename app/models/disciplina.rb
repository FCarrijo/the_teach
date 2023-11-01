class Disciplina < ApplicationRecord
  validates_presence_of :nome, message: 'não pode ficar em branco'
end
