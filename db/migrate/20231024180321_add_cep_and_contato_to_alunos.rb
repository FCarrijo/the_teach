class AddCepAndContatoToAlunos < ActiveRecord::Migration[7.0]
  def change
    add_column :alunos, :cep, :string, limit: 20
    add_column :alunos, :contato, :string, limit: 20
  end
end
