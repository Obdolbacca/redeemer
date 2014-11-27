module Redeemer
  module Redirector
    include ActionController::ForceSSL::ClassMethods
    extend ActiveSupport::Concern

    ACTION_OPTIONS = [:only, :except, :if, :unless]
    URL_OPTIONS = [:protocol, :host, :domain, :subdomain, :port, :path]
    REDIRECT_OPTIONS = [:status, :flash, :alert, :notice]

    def to_secure(options = {})
        remove_callbacks

        action_options = options.slice(*ACTION_OPTIONS)
        redirect_options = options.except(*ACTION_OPTIONS)

        prepend_before_action(action_options) do
          force_ssl_redirect(redirect_options)
        end
    end

    def to_http(options = {})
      remove_callbacks

      action_options = options.slice(*ACTION_OPTIONS)
      redirect_options = options.except(*ACTION_OPTIONS)

      prepend_before_action(action_options) do
        force_http_redirect(redirect_options)
      end
    end

    def remove_callbacks

    end

    def force_http_redirect(host_or_options = nil)
      if request.ssl?
        options = {
          :protocol => :http,
          :host     => request.host,
          :path     => request.fullpath,
          :status   => :moved_permanently
        }

        if host_or_options.is_a?(Hash)
          options.merge!(host_or_options)
        elsif host_or_options
          options[:host] = host_or_options
        end

        secure_url = ActionDispatch::Http::URL.url_for(options.slice(*URL_OPTIONS))
        flash.keep if respond_to?(:flash)
        redirect_to secure_url, options.slice(*REDIRECT_OPTIONS)
      end
    end
  end
end
