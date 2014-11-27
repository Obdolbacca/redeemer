require 'redeemer/redirector'

module Redeemer
  module MacroMethods
    def ensure_secure_protocol
      Redeemer::Redirector.to_secure(self, *params)
    end

    def ensure_http
      Redeemer::Redirector.to_http(self, *params)
    end

    def keep_current_protocol
      Redeemer::Redirector.remove_callbacks(self, *params)
    end
  end
end
