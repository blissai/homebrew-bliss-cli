class Bliss < Formula
  version '1.0.14'
  desc 'Bliss Enterprise Tool for local repository analysis.'
  homepage 'https://github.com/founderbliss/docker'
  url 'https://github.com/founderbliss/bliss-cli/archive/1.0.14.tar.gz'
  sha256 '6c5124ca6199988f2a4c7979381ee7df63baf658047db819a2830b5579a0b99e'
  head 'https://github.com/founderbliss/bliss-cli.git'

  def install
    lib.install Dir['lib/**']
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
