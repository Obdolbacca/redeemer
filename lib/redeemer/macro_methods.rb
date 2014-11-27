require 'redeemer/redirector'

module Redeemer
  module MacroMethods
    def ensure_secure_protocol(options = {})
      Redeemer::Redirector.to_secure(self, *options)
    end

    def ensure_http(options = {})
      Redeemer::Redirector.to_http(self, *options)
    end

    def keep_current_protocol(options = {})
      Redeemer::Redirector.remove_callbacks(self, *options)
    end
  end
end
