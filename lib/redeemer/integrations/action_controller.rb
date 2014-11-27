if defined?(Rails)
  require "redeemer/macro_methods"

  ActionController::Base.class_eval do
    extend Redeemer::MacroMethods

    private

    extend Redeemer::Redirector
  end
end
