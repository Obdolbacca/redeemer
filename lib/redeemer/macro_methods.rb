require 'active_support/concern'
require 'redeemer/redirector'

module Redeemer
  module MacroMethods
    extend ActiveSupport::Concern

    included do
      def self.ensure_secure_protocol(options = {})
        self.to_secure(options)
      end

      def self.ensure_http(options = {})
        Redeemer::Redirector.to_http(options)
      end

      def self.keep_current_protocol(options = {})
        Redeemer::Redirector.remove_callbacks
      end
    end
  end
end
