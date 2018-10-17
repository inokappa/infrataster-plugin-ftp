require 'rspec'
require 'infrataster/resources'

module Infrataster
  module Helpers
    module ResourceHelper
      def ftp(*args)
        Resources::FtpResource.new(*args)
      end
    end
  end
end