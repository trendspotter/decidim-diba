# frozen_string_literal: true

module Decidim
  module Ldap
    module Abilities
      # Defines the abilities related to ldap users
      # Intended to be used with `cancancan`.
      class CurrentUserAbility

        include CanCan::Ability

        attr_reader :user, :context

        def initialize(user, context)
          return unless user

          @user = user
          @context = context

          cannot [:delete, :update], User do |other|
            @user == other && @context[:current_organization].ldap?
          end
        end

      end
    end
  end
end
