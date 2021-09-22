#!/bin/bash

wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -O ~/.git-completion.bash
chmod a+x ~/.git-completion.bash

if type source > /dev/null 2>&1
then
  echo "souce ~/.git-completion.bash" >> ~/.bashrc
  source ~/.bashrc
else
  echo ". ~/.git-completion.bash" >> ~/.bashrc
  . ~/.bashrc
fi

