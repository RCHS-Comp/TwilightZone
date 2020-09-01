########################################################
#                  Harry Nelsen 2020                   #
########################################################
pkg install root-repo x11-repo                         # Setup repos
                                                       #
pkg update; pkg upgrade                                # Update the already installed packages
                                                       #
pkg install xterm xorg-xcalc xorg-xclock i3 tigervnc   # Add the packages
                                                       #
echo "vncserver -localhost :1" > ~/start_server           # Make start server script
echo "export DISPLAY=\":1\"" >> ~/start_server         #
echo "vncserver -kill :1" > ~/stop_server              # Make stop server script
chmod 777 ~/start_server ~/stop_server                 #
                                                       #
echo "exec i3" > ~/.xinitrc                            # Make xinitrc
mkdir -p ~/.vnc                                        # Create VNC config folder if not exist
echo "i3 &" > ~/.vnc/xstartup                          # Overwrite VNC startup
~/start_server                                         # Start VNC server / Config for first time
echo "Connect to localhost:5901 via VNC"               # Tell user where to connect to
echo "Replace 1 with your current display."            #
########################################################
