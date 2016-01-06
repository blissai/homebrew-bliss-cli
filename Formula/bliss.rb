class Bliss < Formula
  version '1.0.15'
  desc 'Bliss Enterprise Tool for local repository analysis.'
  homepage 'https://github.com/founderbliss/docker'
  url 'https://github.com/founderbliss/bliss-cli/archive/1.0.15.tar.gz'
  sha256 '23dc37ac7229de790c4e78af209e64d602b41d64fffcdd61a495aa727b9317e4'
  head 'https://github.com/founderbliss/bliss-cli.git'

  def install
    lib.install Dir['lib/**']
    scripts.install Dir['scripts/**']
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
