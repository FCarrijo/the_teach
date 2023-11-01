class AddPaisToEstados < ActiveRecord::Migration[7.0]
  def change
    unless column_exists? :estados, :pais_id
      add_column :estados, :pais_id, :decimal, precision: 10, scale: 0, null: false
    end
  end
end
