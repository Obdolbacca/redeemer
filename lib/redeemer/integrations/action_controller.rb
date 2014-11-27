if defined?(Rails)
  require "redeemer/macro_methods"

  ActionController::Base.class_eval do
    include Redeemer::MacroMethods
    include Redeemer::Redirector
  end
end
