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
    }

}