require 'infrataster'
require 'net/ftp'

module Infrataster
  module Contexts
    class FtpContext < BaseContext
      def result
        options = {}
        if server.options[:ftp]
          options = options.merge(server.options[:ftp])
        end

        # resource.ftp = Net::FTP.open(options[:host]) do |ftp|
        #   ftp.passive = options[:passive]
        #   ftp.login(options[:user], options[:pass])
        # end

        resource.ftp = Net::FTP.open(options[:host],
                                     user = options[:user],
                                     pass = options[:pass],
                                     acct = nil)
        command = resource.command

        if resource.ftp.respond_to?(command)
          resource.ftp.method(command).call
        end
      end
    end
  end
end
