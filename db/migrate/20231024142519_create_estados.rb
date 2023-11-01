class CreateEstados < ActiveRecord::Migration[7.0]
  def change
    create_table :estados, comment: 'Armazena os estados de um país' do |t|
      t.string :nome,null: false, comment: 'Identifica o nome do Estado'
      t.string :sigla, null: false, limit: 10, comment: 'Identifica a sigla do estado'
      t.timestamps
    end
  end
end
