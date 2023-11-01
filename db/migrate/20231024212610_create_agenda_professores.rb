class CreateAgendaProfessores < ActiveRecord::Migration[7.0]
  def change
    create_table :agenda_professores do |t|
      t.date :dia
      t.decimal :professor_id, null: false, precision: 10, scale: 0
      t.references :disciplina, null: false, foreign_key: true
      t.string :horario

      t.timestamps
    end
  end
end
