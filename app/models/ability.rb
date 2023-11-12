# app/models/ability.rb
class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # Garante que há um usuário, mesmo que não esteja logado

    if user.admin?
      can :manage, :all # Permissões de administrador para todos os modelos
    else
      # can :read, :all   # Permissões padrão para usuários não administradores
      # Permissões específicas do modelo
      # can :manage, Aluno, user_id: user.id # O usuário pode gerenciar apenas seus próprios posts
      # can :manage, Pais, user_id: user.id # O usuário pode gerenciar apenas seus próprios posts
      # can :manage, Estado, user_id: user.id # O usuário pode gerenciar apenas seus próprios posts
      # can :manage, Municipio, user_id: user.id # O usuário pode gerenciar apenas seus próprios posts
      # can :manage, Escolaridade, user_id: user.id # O usuário pode gerenciar apenas seus próprios posts
      # can :manage, Disciplina, user_id: user.id # O usuário pode gerenciar apenas seus próprios posts
      # can :manage, Area, user_id: user.id # O usuário pode gerenciar apenas seus próprios posts
      # can :manage, Professor, user_id: user.id # O usuário pode gerenciar apenas seus próprios posts
      # Adicione outras permissões específicas do modelo conforme necessário
    end
  end
end
