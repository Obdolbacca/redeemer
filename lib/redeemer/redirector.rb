module Redeemer
  module Redirector
    extend ActiveSupport::Concern
    include AbstractController::Callbacks

    def to_secure(owner, params)
      prepend_before_action() do

      end
    end

    def to_https

    end

    def remove_callbacks

    end
  end
end
