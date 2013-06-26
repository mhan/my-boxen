class people::hyleung {
    include java
    include vagrant
    include sublime_text_2
    include chrome
    vagrant::plugin {
        'vagrant-vmware-fusion':
            license => "puppet:///modules/people/hyleung/license.lic";
    }
    class { 'intellij':
            edition => 'community';
    }
    package {
        'android-sdk':
            provider => 'homebrew',
            ensure => 'r22.0.1';
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
        scala:
            provider => 'homebrew';  
        sbt:
            provider => 'homebrew';  
        augeas:
            provider => 'homebrew';                                                    
    }
    package { "puppet-lint":
        ensure => installed,
        provider=>"gem";
    }
    package { "librarian-puppet":
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