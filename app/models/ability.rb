class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    user ||= User.new # guest user (not logged in)
    if user.admin?
      can :manage, :all
    else
      can [:show, :edit, :update], User, id: user.id
      can [:show, :index], Order, user_id: user.id
      can :create, Comment, user_id: user.id
      can [:show, :index], Product
    end
  end
  
end
