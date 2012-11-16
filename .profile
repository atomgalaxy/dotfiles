
# MacPorts Installer addition on 2012-10-27_at_23:53:33: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

if [[ -f ~/.bashrc ]]
then
    . ~/.bashrc
fi
