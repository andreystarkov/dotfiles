echo "🎁 Installing deps, tools & core apps"
# brew bundle
sudo spctl --master-disable
# echo "🎁 Installing shell deps."
source "${PWD}/shell_shell.sh"
echo "🎁 Setting up shell enviroment."
source "${PWD}/setup.sh"
