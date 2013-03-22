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
    }
}