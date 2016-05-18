class Bliss < Formula
  VERSION = '1.0.43'.freeze
  version VERSION.to_s
  desc 'Bliss Enterprise Tool for local repository analysis.'
  homepage 'https://github.com/founderbliss/docker'
  url "https://github.com/founderbliss/bliss-cli/archive/#{VERSION}.tar.gz"
  sha256 '9f392b86a3302a591cc77aaa9e8f5e6fa4225b4ced821383e516bc01baa6e9c7'
  head 'https://github.com/founderbliss/bliss-cli.git'

  def install
    lib.install Dir['lib/**']
    prefix.install Dir['scripts']
    prefix.install 'blisscollector.rb'
    prefix.install 'Gemfile'
    exec_command = "#!/bin/sh\nruby #{prefix}/blisscollector.rb \"$@\""
    File.write('bin/bliss', exec_command)
    bin.install Dir['bin/bliss']
  end

  test do
    system 'bliss', 'help'
  end
end
