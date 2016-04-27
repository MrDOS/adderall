nope:
	@# No compilation for shell scripts makes Jack an insubordinate boy.
	@echo "To install locally: make install or make uninstall"
	@echo "To build a redistributable package: make package or make clean"

install:
	# Put the executable in a safe place.
	mkdir -p /usr/local/bin
	cp adderall /usr/local/bin
	# Adderall runs as an agent, not a daemon, because what's the point of
	# running when the user isn't logged in?
	#
	# Caveat emptor: If you're using a MacBook Air as a server-type machine,
	# you'll definitely want to put the plist in `/Library/LaunchDaemons`
	# instead and adjust the `launchctl` command accordingly.
	cp pkg/Library/LaunchAgents/adderall.plist /Library/LaunchAgents
	# Get your motor runnin'/Head out on the highway.
	launchctl load /Library/LaunchAgents/adderall.plist

uninstall:
	# Goodnight, sweet prince.
	launchctl unload /Library/LaunchAgents/adderall.plist
	rm /usr/local/bin/adderall /Library/LaunchAgents/adderall.plist

package: adderall.pkg

adderall.pkg:
	mkdir -p pkg/usr/local/bin
	cp adderall pkg/usr/local/bin
	pkgbuild --root pkg \
	         --identifier adderall \
	         $@

.PHONY: cealn
clean:
	-rm adderall.pkg
