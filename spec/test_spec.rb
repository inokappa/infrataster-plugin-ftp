require 'spec_helper'

describe server(:ftp_server) do
  describe ftp('welcome') do
    it 'check accessible' do
      expect(result.chomp).to eq('230 Login successful.')
    end
  end

  describe ftp('pwd') do
    it 'check `chroot` enabled' do
      expect(result).to eq('/')
    end
  end
end
