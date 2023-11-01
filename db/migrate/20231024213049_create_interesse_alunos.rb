class CreateInteresseAlunos < ActiveRecord::Migration[7.0]
  def change
    create_table :interesse_alunos do |t|
      t.references :aluno, null: false, foreign_key: true
      t.references :area, null: false, foreign_key: true

      t.timestamps
    end
  end
end
