module Redeemer
  class Redirector
    class << self
      def to_secure
        prepend_before_action(action_options) do

        end
      end

      def to_https

      end

      def remove_callbacks

      end
    end
  end
end
