class people::hyleung {
    package {
        'android-sdk':
            provider => 'homebrew',
            ensure => 'r21.1';
        'android-ndk':
            provider => 'homebrew',
            ensure => 'r8d';
        'jq':
            provider => 'homebrew';
        'wget':
            provider => 'homebrew';
        'gradle':
            provider => 'homebrew';    
        'maven':
            provider => 'homebrew';            
        'gibo':
            provider => 'homebrew';
        heroku-toolbelt:
            provider => 'homebrew';            
        "facter-1.6.18":
            ensure => installed,
            provider => 'pkgdmg',
            source => "http://downloads.puppetlabs.com/mac/facter-1.6.18.dmg";
        "puppet-3.1.1":
            ensure => installed,
            provider => 'pkgdmg',
            source => "http://downloads.puppetlabs.com/mac/puppet-3.1.1.dmg";
        "hiera-1.2.0-rc2":
            ensure => installed,
            provider => 'pkgdmg',
            source => "http://downloads.puppetlabs.com/mac/hiera-1.2.0-rc2.dmg";      
        "vagrant-1.1.2":
            ensure => installed,
            provider => 'pkgdmg',
            source => "http://files.vagrantup.com/packages/67bd4d30f7dbefa7c0abc643599f0244986c38c8/Vagrant.dmg";      
    }
    file {
        "/etc/hosts":
            ensure => present,
            source => "puppet:///modules/people/hyleung/hosts",
            owner => root,
            group => wheel;
        "/Users/hyleung/.bash_profile":
            ensure => present,
            source => "puppet:///modules/people/hyleung/my.bash_profile",
    }
    file {
        "/usr/local/bin/git":
            ensure => link,
            target => "/opt/boxen/homebrew/bin/git",
            require => Class["git"];
        "/Users/hyleung/.gitconfig":
            ensure => present,
            source => "puppet:///modules/people/hyleung/my.gitconfig",
            require => Class["git"];
    }
}