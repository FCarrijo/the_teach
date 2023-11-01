class Pais < ApplicationRecord

  self.table_name = 'paises'
  has_many :estados
end
