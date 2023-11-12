# db/migrate/[timestamp]_add_admin_to_users.rb
class CreateUserAdmin < ActiveRecord::Migration[6.0]
  def change
    User.where(email: 'admin@theteach.com.br').first_or_create(name: 'Administrador', password: '1234', admin: true)
  end
end
