nope:
	# No compilation for shell scripts makes Jack an insubordinate boy.
	@echo "Please specify either the \"install\" or \"uninstall\" target."

install:
	# Put the executable in a safe place.
	cp adderall /usr/bin
	# Adderall runs as an agent, not a daemon, because what's the point of
	# running when the user isn't logged in?
	#
	# Caveat emptor: If you're using a MacBook Air as a server-type machine,
	# you'll definitely want to put the plist in `/Library/LaunchDaemons`
	# instead and adjust the `launchctl` command accordingly.
	cp adderall.plist /Library/LaunchAgents
	# Get your motor runnin'/Head out on the highway.
	launchctl load /Library/LaunchAgents/adderall.plist

uninstall:
	# Goodnight, sweet prince.
	launchctl unload /Library/LaunchAgents/adderall.plist
	rm /usr/bin/adderall /Library/LaunchAgents/adderall.plist
