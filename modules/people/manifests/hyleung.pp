class people::hyleung {
    include java
    include vagrant
    include sublime_text_2
    include chrome
    include colloquy
    include macvim
    include android::sdk
    include android::ndk
    include iterm2::stable
    include virtualbox
    include divvy
    vagrant::plugin {
        'vagrant-vmware-fusion':
            license => "puppet:///modules/people/hyleung/license.lic";
    }
    vagrant::box {
	'precise64/virtualbox':
		source => "http://puppet-vagrant-boxes.puppetlabs.com/ubuntu-server-12042-x64-vbox4210.box"
    }

    class { 'intellij':
            edition => 'community';
    }
    package {
        'jq':
            provider => 'homebrew';
        'wget':
            provider => 'homebrew';
        'gradle':
            provider => 'homebrew';    
        'maven':
	    ensure => "3.0.5",
            provider => 'homebrew';            
        'gibo':
            provider => 'homebrew';
        heroku-toolbelt:
            provider => 'homebrew';  
        scala:
            provider => 'homebrew';  
        sbt:
            provider => 'homebrew';  
        augeas:
            provider => 'homebrew';                                                    "thrift":
	    provider => "homebrew";
    }
    package { "puppet-lint":
        ensure => installed,
        provider=>"gem";
    }
   host {
        "fsvan.foresee.com":
            ip => "204.244.61.21",
            ensure => present,
            comment => "ForeSee Vancouver external IP";
    }
    file {
        "/Users/hyleung/.bash_profile":
            ensure => present,
            source => "puppet:///modules/people/hyleung/my.bash_profile",
    }
    file {
	"/Users/hyleung/.git-completion.bash":
		ensure => present,
		source => "puppet:///modules/people/hyleung/my.git-completion.bash",
    }

    file {
	"/usr/local":
		ensure => directory;
	"/usr/local/bin":
		ensure => directory;
        "/usr/local/bin/git":
            ensure => link,
            target => "/opt/boxen/homebrew/bin/git",
            require => [Class["git"]];
        "/Users/hyleung/.gitconfig":
            ensure => present,
            source => "puppet:///modules/people/hyleung/my.gitconfig",
            require => Class["git"];
    }
}
