Apple Cinema Display Backlight Brightness Control via ACPI Events
===

While Gnome doesn't allow simple rebinding of the "Monitor Brightness Up" or "Monitor Brightness Down" keys, one can instead rebind their actions at a lower level.

ACPI is how Linux systems normally control monitor backlights (`ls /sys/class/backlight/`),
but there is no such driver for Apple Cinema Displays.
Fortunately the command line tool `acdcontrol` can be hooked in via ACPI events.

Ensure `acdcontrol` has been pulled in and compiled:
	git submodule update --init
	(cd acdcontrol && make)

Copy the necessary files into `/etc/acpi` (requires root):
	sudo cp events/acd-* /etc/acpi/events/
	sudo cp acdcontrol.sh acdcontrol/acdcontrol /etc/acpi/
	sudo systemctl restart acpid

Tested using Ubuntu 20.04 with an Apple Keyboard and 27" Apple Cinema Display. 
