class Bliss < Formula
  VERSION = '1.0.41'
  version "#{VERSION}"
  desc 'Bliss Enterprise Tool for local repository analysis.'
  homepage 'https://github.com/founderbliss/docker'
  url "https://github.com/founderbliss/bliss-cli/archive/#{VERSION}.tar.gz"
  sha256 '2095bdc4c03507af04e79c0dce44ace87c9daaeb6a3a1515211c3957c24c1b01'
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
