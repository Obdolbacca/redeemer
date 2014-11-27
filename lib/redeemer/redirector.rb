module Redeemer
  module Redirector
    include ActionController::ForceSSL::ClassMethods
    extend ActiveSupport::Concern

    ACTION_OPTIONS = [:only, :except, :if, :unless]
    URL_OPTIONS = [:protocol, :host, :domain, :subdomain, :port, :path]
    REDIRECT_OPTIONS = [:status, :flash, :alert, :notice]

    included do

      def self.redeemer_options(protocol = :http)
        {
          protocol:   protocol,
          host:       request.host,
          port:       request.port,
          path:       request.fullpath,
        }
      end

      def self.to_secure(options = {})
          remove_callbacks

          action_options = options.slice(*ACTION_OPTIONS)
          redirect_options = options.except(*ACTION_OPTIONS)

          redirect_options.merge!(redeemer_options(:https))

          prepend_before_action(action_options) do
            force_ssl_redirect(redirect_options)
          end
      end

      def self.to_http(options = {})
        remove_callbacks

        action_options = options.slice(*ACTION_OPTIONS)
        redirect_options = options.except(*ACTION_OPTIONS)

        redirect_options.merge!(redeemer_options)

        prepend_before_action(action_options) do
          force_http_redirect(redirect_options)
        end
      end

      def self.remove_callbacks

      end
    end
  end
end
