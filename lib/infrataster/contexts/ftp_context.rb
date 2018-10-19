require 'infrataster'
require 'net/ftp'

module Infrataster
  module Contexts
    # FTP Context
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

        command, argument = resource.command.split

        response = ''
        if resource.ftp.respond_to?(command)
          response = resource.ftp.method(command).call if argument.nil?
          response = resource.ftp.method(command).call(argument) if argument
          resource.ftp.method('close').call
        end
        return response.join if response.is_a?(Array)
        response
      end
    end
  end
end
