class AccessPolicy
  include AccessGranted::Policy

  def configure
    # Example policy for AccessGranted.
    # For more details check the README at
    #
    # https://github.com/chaps-io/access-granted/blob/master/README.md
    #
    # Roles inherit from less important roles, so:
    # - :admin has permissions defined in :member, :guest and himself
    # - :member has permissions from :guest and himself
    # - :guest has only its own permissions since it's the first role.
    #
    # The most important role should be at the top.
    # In this case an administrator.
    #
    # role :admin, proc { |user| user.admin? } do
    #   can :destroy, User
    # end

    role :owner, proc { |user| user.owner? } do
      can :manage, Lease
    end

    role :manager, proc { |user| user.manager? } do
      can [:read, :update], Lease
    end

    role :tenant, proc { |user| user.tenant? } do
      can :read, Lease
    end

  end
end
