class Estado < ApplicationRecord

  belongs_to :pais, class_name: "Pais", foreign_key: :pais_id

  validates_presence_of :nome, message: 'não pode ficar em branco'
  validates_presence_of :sigla
  validates_uniqueness_of :sigla
end