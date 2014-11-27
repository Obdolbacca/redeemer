module Redeemer
  module Redirector
    extend ActiveSupport::Concern
    include AbstractController::Callbacks

    def self.to_secure(owner, params)
      prepend_before_action() do

      end
    end

    def self.to_https

    end

    def self.remove_callbacks

    end
  end
end
