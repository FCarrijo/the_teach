class Professor < ApplicationRecord
  validates_presence_of :nome, message: 'é obrigatório'
  validates_presence_of :email, message: 'é obrigatório'
  validates_uniqueness_of :email, message: 'é único'
end
