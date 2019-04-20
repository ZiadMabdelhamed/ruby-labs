class Ability
  
  include CanCan::Ability

  def initialize(user)
    # user ||= User.new # guest user (not logged in)
    
      # can :read,  :all
      # can :update,  :all
      # can [:update, :destroy ,:read ,:write], [Article, Comment]
      if user.present?
        can [:update ,:read ,:write], [Comment,Article]
        # can [:update, :destroy], Article, :user_id => user.id
        can :destroy, Article, :user_id => user.id

      end
  end
end