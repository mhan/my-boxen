# This file manages Puppet module dependencies.
#
# It works a lot like Bundler. We provide some core modules by
# default. This ensures at least the ability to construct a basic
# environment.

def github(name, version, options = nil)
  options ||= {}
  options[:repo] ||= "boxen/puppet-#{name}"
  mod name, version, :github_tarball => options[:repo]
end

# Includes many of our custom types and providers, as well as global
# config. Required.

github "boxen", "3.0.1"

# Core modules for a basic development environment. You can replace
# some/most of these if you want, but it's not recommended.
github "autoconf",   "1.0.0"
github "dnsmasq",    "1.0.0"
github "gcc",        "2.0.1"
github "git",        "1.2.5"
github "homebrew",   "1.4.1"
#github "hub",        "1.0.3"
github "inifile",    "1.0.0", :repo => "puppetlabs/puppetlabs-inifile"
github "nginx",      "1.4.2"
github "nodejs",     "3.2.8"
github "openssl",    "1.0.0"
github "repository", "2.2.0"
github "ruby",       "6.2.0"
github "stdlib",     "4.1.0", :repo => "puppetlabs/puppetlabs-stdlib"
github "sudo",       "1.0.0"
github "xquartz",    "1.1.0"

# CUSTOM
github "vagrant",   "2.0.9"
github "intellij",   "1.3.0"
github "sublime_text_2", "1.1.2"
github "java",   "1.1.2"
github "chrome",    "1.1.1"
github "colloquy",	"1.0.0"
github "iterm2", "1.0.2"
github "macvim", "1.0.0"
github "virtualbox", "1.0.4"
github "divvy", "1.0.1"
github "keyremap4macbook", "1.0.4"
github "gimp", "1.0.0"
github "dropbox", "1.1.0"
github "skitch", "1.0.1"
github "flux", "1.0.0"
github "rdio", "1.0.0"
github "osx", "1.5.0"
# Optional/custom modules. There are tons available at
# https://github.com/boxen.
