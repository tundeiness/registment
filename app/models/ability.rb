# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new(role: 'normal')
    if user.super_admin?
      can :manage, :all
    elsif user.admin?
      can %i[read create update], Booking, user_id: user.id
      can %i[read create], Equipment, user_id: user.id
      can %i[read], EquipmentCondition, user_id: user.id
    else
      can :read, Equipment, user_id: user.id
      cannot %i[read create update delete], Booking
      cannot %i[read create update delete], EquipmentCondition
    end

    # case user
    # when user.super_admin?
    #   can :manage, :all
    #   # can :manage, :dashboard
    # when user.admin?
    #   can %i[read create update], Booking
    #   can %i[read create], Equipment
    # else
    #   can :read, Equipment
    #   cannot :manage, Booking
    # end
    # Define abilities for the user here. For example:
    #
    #   return unless user.present?
    #   can :read, :all
    # return unless user.admin?
    # can :manage, :all
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, published: true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/blob/develop/docs/define_check_abilities.md
  end
end
