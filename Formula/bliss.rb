class Bliss < Formula
  VERSION = '1.0.47'.freeze
  version VERSION.to_s
  desc 'Bliss Enterprise Tool for local repository analysis.'
  homepage 'https://github.com/founderbliss/docker'
  url "https://github.com/founderbliss/bliss-cli/archive/#{VERSION}.tar.gz"
  sha256 'e21e992fa2980753578ddf0e0a1376f2368659884f932a978e07995b4d61334e'
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
