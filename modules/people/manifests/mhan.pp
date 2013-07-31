class people::mhan {
    include java
    include vagrant
    include sublime_text_2
    include chrome
    include colloquy
    include macvim
    include iterm2::stable
    include virtualbox
    include divvy
    include gimp
    include dropbox
    include skitch
    include flux
    include rdio
    include keyremap4macbook
    include keyremap4macbook::login_item

    keyremap4macbook::remap{ 'command_r2escape': }
    exec {
        'git clone pathogen':
            unless => 'test -d /Users/mhan/development/github/vim-pathogen',
            command => 'git clone https://github.com/tpope/vim-pathogen.git /Users/mhan/development/github/vim-pathogen',
            require => File['/Users/mhan/development/github'];

        'cp /Users/mhan/development/github/vim-pathogen/autoload/pathogen.vim /Users/mhan/.vim/autoload/pathogen.vim':
            unless => 'test -f /Users/mhan/.vim/autoload/pathogen.vim',
            require => [Exec['git clone pathogen'], File['/Users/mhan/.vim/autoload']];
    }
    file {
        '/Users/mhan/.vim':
            ensure => directory;
        '/Users/mhan/.vim/autoload':
            ensure => directory,
            require => File['/Users/mhan/.vim'];
    }

    file {
        '/Users/mhan/development':
            ensure => directory;

        '/Users/mhan/development/github':
            ensure => directory,
            require => File['/Users/mhan/development'];
    }

    file {
        '/Users/mhan/.vimrc':
            ensure => present,
            source => 'puppet:///modules/people/mhan/my.vimrc';
    }

    exec {
        'git clone vim-colors-solarized':
            unless => 'test -d /Users/mhan/.vim/bundle/vim-colors-solarized',
            command => 'git clone https://github.com/altercation/vim-colors-solarized.git /Users/mhan/.vim/bundle/vim-colors-solarized',
            require => File['/Users/mhan/.vim/bundle'];
    }

    file {
        '/Users/mhan/.vim/bundle':
            ensure => directory,
            require => File['/Users/mhan/.vim'];
    }

    vagrant::box {
        'precise64/virtualbox':
            source => 'http://puppet-vagrant-boxes.puppetlabs.com/ubuntu-server-12042-x64-vbox4210.box'
    }

    class {
        'intellij':
            edition => 'community';
    }
    
    package {
        'cocoapods':
            ensure => installed,
            provider=> 'gem';
        'rubyzip':
            ensure => installed,
            provider=> 'gem';
    }

    package {
        'jq':
            provider => 'homebrew';
        'wget':
            provider => 'homebrew';
        'gradle':
            provider => 'homebrew';
        'gibo':
            provider => 'homebrew';
    }

    package {
        'puppet-lint':
            ensure => installed,
            provider=>'gem';
    }

    host {
        'fsvan.foresee.com':
            ip => '204.244.61.21',
            ensure => present,
            comment => 'ForeSee Vancouver external IP';
    }
    file {
        '/Users/mhan/.bash_profile':
            ensure => present,
            source => 'puppet:///modules/people/mhan/my.bash_profile',
    }

    file {
        '/Users/mhan/bin':
            ensure => directory;

        '/Users/mhan/bin/mvim':
            ensure => present,
            require => File['/Users/mhan/bin'],
            source => 'puppet:///modules/people/mhan/my.mvim';

        '/Users/mhan/.git-completion.bash':
            ensure => present,
            source => 'puppet:///modules/people/mhan/my.git-completion.bash';
        
        '/Users/mhan/.git-prompt.sh':
            ensure => present,
            source => 'puppet:///modules/people/mhan/my.git-prompt.sh';
        
        '/Users/mhan/.gitconfig':
            ensure => present,
            source => 'puppet:///modules/people/mhan/my.gitconfig',
            require => Class['git'];
    }
}
