class Ability
  include CanCan::Ability

  def initialize(user)
    if user.blank?
      cannot :manage, :all
      basic_use
    elsif user.has_role?("admin")
      can :manage, :all
    else
    basic_use
    end
   
  end

  private
   def basic_use
       can :update, User
       can :read, Product
   end

end
