module Decidim
  module AgeActionAuthorization
    class Authorizer < Decidim::Verifications::DefaultActionAuthorizer

      def missing_fields
        @missing_fields ||= (valid_metadata? ? [] : [:birthdate])
      end

      def unmatched_fields
        @unmatched_fields ||= (valid_age? ? [] : [:birthdate])
      end

      private

      def valid_metadata?
        return unless authorization
        !authorization.metadata['birthdate'].nil?
      end

      def valid_age?
        (birthdate + minimum_age.years) <= Date.current
      end

      def birthdate
        @birthdate ||= Date.strptime(authorization.metadata['birthdate'], '%Y/%m/%d')
      end

      def minimum_age
        @minimum_age ||= begin
          Integer(options['edad'].to_s, 10)
        rescue ArgumentError
          18
        end
        @minimum_age
      end

    end
  end
end
