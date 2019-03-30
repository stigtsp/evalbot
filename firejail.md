# firejail notes

firejail --private --caps.drop=all --cpu=0 --nosound --novideo --net=none --nodbus --noroot --private-tmp --seccomp --quiet --timeout=00:00:30 --x11=none -c perl6 -e 'say "/tmp".IO.dir;say qx|curl -s https://ifconfig.co;|;say qx|ip a|';
