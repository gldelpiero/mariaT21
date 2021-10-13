#!/bin/bash

echo "roscore"
gnome-terminal -- bash -c "source ~/Dropbox/mariaT21/devel/setup.bash; roscore;exec bash"
sleep 3

echo "log"
gnome-terminal -- bash -c "source ~/Dropbox/mariaT21/devel/setup.bash; rosrun marialog marialog"
sleep 1

echo "simulacao"
gnome-terminal -- bash -c "source ~/Dropbox/mariaT21/devel/setup.bash; ./simulacao.sh"
sleep 3

echo "callrosaria"
gnome-terminal -- bash -c "source ~/Dropbox/mariaT21/devel/setup.bash; ./callrosaria.sh"
sleep 3

echo "child_detection"
gnome-terminal -- bash -c "source ~/Dropbox/mariaT21/devel/setup.bash; rosrun child_detection child_detection"
sleep 1

echo "workspace"
gnome-terminal -- bash -c "source ~/Dropbox/mariaT21/devel/setup.bash; rosrun workspace workspace"
sleep 1

echo "state_machine"
gnome-terminal -- bash -c "source ~/Dropbox/mariaT21/devel/setup.bash; rosrun state_machine state_machine"
sleep 1

echo "callteste"
gnome-terminal -- bash -c "source ~/Dropbox/mariaT21/devel/setup.bash; rosrun testekid testekid path1.txt"
sleep 2

echo "control_law"
gnome-terminal -- bash -c "source ~/Dropbox/mariaT21/devel/setup.bash; rosrun control_law control_law"
sleep 2

echo "emotion_detection"
gnome-terminal -- bash -c "source ~/Dropbox/mariaT21/devel/setup.bash; rosrun emotion_detection emotion_detection"
sleep 1

exit 0
