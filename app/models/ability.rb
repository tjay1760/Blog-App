class Ability
  include CanCan::Ability
  def initialize(user)
    can :read, Post
    return unless user.present?
    can :destroy, Post , author: user
    return unless user.admin?
    can :destroy, Post
  end
end
