# db/migrate/[timestamp]_add_admin_to_users.rb
class AddColumnUserIdToAluno < ActiveRecord::Migration[6.0]
  def change
    add_column :alunos, :user_id, :bigint
  end
end
