class Bliss < Formula
  version '1.0.15'
  desc 'Bliss Enterprise Tool for local repository analysis.'
  homepage 'https://github.com/founderbliss/docker'
  url 'https://github.com/founderbliss/bliss-cli/archive/1.0.15.tar.gz'
  sha256 'edd77226f40530e4088cf76945e45aca703da50040966707ac9400a456c8ce0c'
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
