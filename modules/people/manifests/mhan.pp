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
    include keyremap4macbook::login_item

    keyremap4macbook::remap{ 'capslock2escape': }

    exec {
        'git clone pathogen':
            unless => 'test -d ~/development/github/vim-pathogen'
            command => 'git clone https://github.com/tpope/vim-pathogen.git ~/development/github/vim-pathogen'
            require => File['~/development/github'];

        'cp ~/development/github/vim-pathogen/autoload/pathogen.vim ~/.vim/autoload/pathogen.vim':
            unless => 'test -f ~/.vim/autoload/pathogen.vim'
            require => File['~/.vim/autoload'];
    }
    file {
        '~/.vim/autoload':
            ensure => directory;
    }

    file {
        '~/development/github':
            ensure => directory;
    }

    file {
        '.vimrc':
            ensure => present,
            source => 'puppet:///modules/people/mhan/my.vimrc';
    }

    exec {
        'git clone vim-colors-solarized':
            unless => 'test -d ~/.vim/bundle/vim-colors-solarized'
            command => 'git clone https://github.com/altercation/vim-colors-solarized.git ~/.vim/bundle/vim-colors-solarized'
            require => File['.vim/bundle'];
    }

    file {
        '.vim/bundle':
            ensure => directory;
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
        '/Users/mhan/.git-completion.bash':
            ensure => present,
            source => 'puppet:///modules/people/mhan/my.git-completion.bash',
        
        '/Users/mhan/.git-prompt.sh':
            ensure => present,
            source => 'puppet:///modules/people/mhan/my.git-prompt.sh',
        
        '/Users/mhan/.gitconfig':
            ensure => present,
            source => 'puppet:///modules/people/mhan/my.gitconfig',
            require => Class['git'];
    }
}
