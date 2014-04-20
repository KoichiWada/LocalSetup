#!/bin/sh

curl https://raw.github.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash
curl https://raw.github.com/git/git/master/contrib/completion/git-prompt.sh -o ~/.git-prompt.sh

if [ $(grep -c git-completion.bash ~/.bashrc) -eq 0 ]; then
    cat $(dirname $0)/../src/git-completion >> ~/.bashrc
fi

