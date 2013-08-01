class people::mhan {
    $ruby_version = '1.9.3-p448'

    class { 'ruby::global':
        version => "${ruby_version}"
    }

    class { 'nodejs::global':
        version => 'v0.10.13'
    }

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
    
    ruby::gem { "cocoapods for ${ruby_version}":
        gem => 'cocoapods',
        ruby => $ruby_version,
    }

    ruby::gem { "rubyzip for ${ruby_version}":
        gem => 'rubyzip',
        ruby => $ruby_version,
    }

    git::config::global {
        'user.name':
            value => 'Michael Han';
        'user.email':
            value => 'han.michael@gmail.com';
        'color.ui':
            value => 'true';
        'color.branch':
            value => 'auto';
        'core.editor':
            value => 'mvim -f';
        'alias.lawg':
            value => 'log --graph --pretty=format:\'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset\' --abbrev-commit --date=relative';
        'alias.unstage':
            value => 'reset HEAD';
        'alias.rollback':
            value => 'checkout';
        'alias.staged-diff':
            value => 'diff --cached';
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

    host { 'fsvan.foresee.com':
            ip => '204.244.61.21',
            ensure => present,
            comment => 'ForeSee Vancouver external IP';
    }
    file {
        '/Users/mhan/.bash_profile':
            ensure => present,
            source => 'puppet:///modules/people/mhan/my.bash_profile',
            require => [File['/Users/mhan/.git-completion.bash'], File['/Users/mhan/.git-prompt.sh']];
    }

    file {
        '/Users/mhan/.git-completion.bash':
            ensure => present,
            source => 'puppet:///modules/people/mhan/my.git-completion.bash';
        
        '/Users/mhan/.git-prompt.sh':
            ensure => present,
            source => 'puppet:///modules/people/mhan/my.git-prompt.sh';
    }
}
