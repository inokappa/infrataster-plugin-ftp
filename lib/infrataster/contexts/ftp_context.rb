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

        resource.ftp = Net::FTP.open(server.address,
                                     user = options[:user],
                                     pass = options[:pass],
                                     acct = nil)
        command = resource.command

        response = ''
        if resource.ftp.respond_to?(command)
          response = resource.ftp.method(command).call
          resource.ftp.method('close').call
        end
        response
      end
    end
  end
end
