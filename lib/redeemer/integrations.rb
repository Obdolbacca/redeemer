require "redeemer/macro_methods"

ActionController::Base.class_eval do
  extend Redeemer::MacroMethods
end
