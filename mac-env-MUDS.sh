#!/bin/sh

# Check Shell
if [ $SHELL = "" ]; then
    echo "ERROR!"
elif [ $SHELL = "/bin/bash" ]; then
    sh_profile=.bash_profile

elif [ $SHELL = "/bin/zsh" ]; then
    sh_profile=.zprofile
fi


# Install Homebrew
xcode-select --install
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"


# Alias Settings(Optional)
# echo 'export alias ls="ls -G"' >> ~/$sh_profile
# echo 'alias ll="ls -lG"' >> ~/$sh_profile
# echo 'alias la="ls -laG"' >> ~/$sh_profile
# echo 'alias mi="open -a /Applications/mi.app"' >> ~/$sh_profile

# source ~/$sh_profile


# Homebrew
brew update
brew install pyenv
brew install pipenv


# Option
# brew install nodenv
# brew install npm


# Install Python.
pyenv install 3.8.2
pyenv install 3.6.7


# Export pyenv settings.
echo 'export PYENV_ROOT=${HOME}/.pyenv' >> ~/$sh_profile
echo 'if [ -d "${PYENV_ROOT}" ]; then' >> ~/$sh_profile
echo '  export PATH=${PYENV_ROOT}/bin:$PATH' >> ~/$sh_profile
echo '  eval "$(pyenv init -)"' >> ~/$sh_profile
echo 'fi' >> ~/$sh_profile

source ~/$sh_profile

pyenv global 3.8.2

read -p "Enter the name of the new directory which create in home directory.:" dir_name
mkdir ~/$dir_name
cd ~/$dir_name

pyenv local 3.6.7
pipenv --python 3.6.7


# Option
# pipenv install numpy
# pipenv install pandas
# pipenv install flask
