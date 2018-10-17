require 'infrataster'
require 'net/ftp'

module Infrataster
  module Resources
    class FtpResource < BaseResource
      Error = Class.new(StandardError)

      attr_reader :command
      attr_accessor :ftp

      def initialize(command)
        @command = command
        @ftp = nil
      end

      def to_s
        "ftp:"
      end
    end
  end
end