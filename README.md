# Infrataster::Plugin::Ftp
[![Build Status](https://travis-ci.org/inokappa/infrataster-plugin-ftp.svg?branch=master)](https://travis-ci.org/inokappa/infrataster-plugin-ftp)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'infrataster-plugin-ftp'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install infrataster-plugin-ftp

## Usage

```ruby
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

  describe ftp('mkdir test_dir') do
    it 'run `mkdir`' do
      expect(result).to include '/test_dir'
    end
  end

  describe ftp('ls') do
    it 'run ls' do
      expect(result).to include 'sample.txt'
    end
  end
end
```

You can specify `server.address`, username, password by options passed to Infrataster::Server.define:

```ruby
Infrataster::Server.define(
  :ftp_server,
  '192.168.0.6',
  ftp: { user: 'ftpuser', pass: 'supersecret', passive: true },
)
```
## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/infrataster-plugin-ftp.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
