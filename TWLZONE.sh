#########################################################
#                   Harry Nelsen 2020                   #
#########################################################
                                                        #
echo "You're traveling through another dimension --"    # Twilight Zone intro
echo "a dimension not only of sight and sound"          #
echo "but of mind. A journey into a wondrous land"      #
echo "whose boundaries are that of imagination."        #
echo "That's a signpost up ahead: your next stop:"      #
echo "the Twilight Zone!"                               #
                                                        #
sleep 3                                                 #
                                                        #
pkg install root-repo x11-repo -y                       # Setup repos
                                                        #
pkg update; pkg upgrade -y                              # Update the already installed packages
                                                        #
pkg install xterm xorg-xcalc xorg-xclock i3 tigervnc -y # Add the packages
                                                        #
echo "vncserver -localhost :1" > ~/start_server         # Make start server script
echo "export DISPLAY=\":1\"" >> ~/start_server          #
echo "vncserver -kill :1" > ~/stop_server               # Make stop server script
chmod 777 ~/start_server ~/stop_server                  #
                                                        #
echo "exec i3" > ~/.xinitrc                             # Make xinitrc
mkdir -p ~/.vnc                                         # Create VNC config folder if not exist
echo "i3 &" > ~/.vnc/xstartup                           # Overwrite VNC startup
chmod 777 ~/.vnc/xstartup                               #
~/start_server                                          # Start VNC server / Config for first time
echo "Connect to localhost:5901 via VNC"                # Tell user where to connect to
echo "By default your display is set to 1."             #
echo "If you wish to change that, replace the 1"        #
echo "With the display number."                         #
                                                        #
echo "To launch server:" > ~/README                     # Make README file
echo -e "./start_server\n" >> ~/README                  #
echo "To stop server:" >> ~/README                      #
echo -e "./stop_server\n" >> ~/README                   #
echo "(c) Harry Nelsen 2020" >> ~/README                #
#########################################################
