class CreateAgendaAlunos < ActiveRecord::Migration[7.0]
  def change
    create_table :agenda_alunos do |t|
      t.references :aluno, null: false, foreign_key: true
      t.references :agenda_professor, null: false, foreign_key: true
      t.text :observacao

      t.timestamps
    end
  end
end
