class Ability
  include CanCan::Ability

  attr_reader :user

  def initialize(user)
    @user= user

    if user
      user.admin? ? admin_abilities : guest_abilities
    else
      guest_abilities
    end
  end

  def guest_abilities
    can :read, Feedback
    can :create, Feedback
  end

  def admin_abilities
    can :manage, :all
  end

end
