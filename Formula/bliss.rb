class Bliss < Formula
  VERSION = '1.0.32'
  version "#{VERSION}"
  desc 'Bliss Enterprise Tool for local repository analysis.'
  homepage 'https://github.com/founderbliss/docker'
  url "https://github.com/founderbliss/bliss-cli/archive/#{VERSION}.tar.gz"
  sha256 '2df8a39d896cb71f67b4a83982a88520a887abb6e2a665d2e568bcf48415e679'
  head 'https://github.com/founderbliss/bliss-cli.git'

  def install
    lib.install Dir['lib/**']
    prefix.install Dir['scripts']
    prefix.install 'blisscollector.rb'
    prefix.install 'Dockerfile'
    prefix.install 'Gemfile'
    exec_command = "#!/bin/sh\nruby #{prefix}/blisscollector.rb \"$@\""
    File.write('bin/bliss', exec_command)
    bin.install Dir['bin/bliss']
  end

  test do
    system 'bliss', 'help'
  end
end
