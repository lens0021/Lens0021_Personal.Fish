function _lens0021_install
    argparse --stop-nonopt -- $argv

    if functions --query _lens0021_install_$argv[1]
        _lens0021_install_$argv[1] $argv[2..]
    else
        echo no $argv[1]
    end
end

function _lens0021_install_saml2aws
    set -l ver 2.36.15
    set -l arch arm64
    curl -L "https://github.com/Versent/saml2aws/releases/download/v$ver/saml2aws_""$ver""_linux_$arch.tar.gz" ~/Downloads/saml2aws.tar.gz
    tar -xzvf ~/Downloads/saml2aws.tar.gz -C ~/Downloads
    sudo install ~/Downloads/saml2aws /usr/local/bin/saml2aws
    rm -f ~/Downloads/README.md ~/Downloads/LICENSE.md
end
