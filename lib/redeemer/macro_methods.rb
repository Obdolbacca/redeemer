require 'redeemer/redirector'

module Redeemer
  module MacroMethods
    def ensure_secure_protocol(options = {})
      self.to_secure(options)
    end

    def ensure_http(options = {})
      Redeemer::Redirector.to_http(options)
    end

    def keep_current_protocol(options = {})
      Redeemer::Redirector.remove_callbacks
    end
  end
end
