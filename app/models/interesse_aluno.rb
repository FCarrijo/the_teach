class InteresseAluno < ApplicationRecord
  belongs_to :aluno
  belongs_to :area
end
