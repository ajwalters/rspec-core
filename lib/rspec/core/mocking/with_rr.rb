require 'rr'

Rspec.configuration.backtrace_clean_patterns.push(RR::Errors::BACKTRACE_IDENTIFIER)

module Rspec
  module Core
    module MockFrameworkAdapter

      include RR::Extensions::InstanceMethods

      def _setup_mocks
        RR::Space.instance.reset
      end

      def _verify_mocks
        RR::Space.instance.verify_doubles
      end

      def _teardown_mocks
        RR::Space.instance.reset
      end

    end
  end
end
