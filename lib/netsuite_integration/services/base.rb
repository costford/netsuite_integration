module NetsuiteIntegration
  module Services
    class Base
      attr_reader :config

      class << self
        attr_accessor :client
      end

      def initialize(config)
        @config = config

        self.class.client ||= NetSuite.configure do
          reset!
          api_version config.fetch('netsuite.api_version')
          wsdl        config.fetch('netsuite.wsdl_url')
          sandbox     config.fetch('netsuite.sandbox')
          email       config.fetch('netsuite.email')
          password    config.fetch('netsuite.password')
          account     config.fetch('netsuite.account')
          role        config.fetch('netsuite.role_id')
          log_level   :error
        end
      end
    end
  end
end
