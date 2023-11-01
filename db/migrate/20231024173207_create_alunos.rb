class CreateAlunos < ActiveRecord::Migration[7.0]
  def change
    create_table :alunos do |t|
      t.string :nome, null: false
        t.string :cpf, null: false
      t.string :email, null: false
      t.date :dta_nasc, null: false
      t.string :nome_mae
      t.string :nome_pai
      t.string :logradouro
      t.string :bairro
      t.integer :municipio_id#, null: false, foreign_key: true
      t.integer :escolaridade_id#, null: false, foreign_key: true
      t.boolean :esc_concluida

      t.timestamps
    end
  end
end
