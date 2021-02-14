Linux keybindings for Apple Cinema Display backlight brightness
===

This allows the standard `Monitor Brightness Up` and `Monitor Brightness Down` keys on my Apple Keyboard to control the backlight brightness on my 27" Apple Cinema Display when running Ubuntu 20.04. 

Gnome doesn't allow directly rebinding the `Monitor Brightness Up` or `Monitor Brightness Down` keys.
Instead one must alter their actions at a lower level.

ACPI is how Linux systems normally control monitor backlights (`ls /sys/class/backlight/`), but there is no such driver for Apple Cinema Displays.
Fortunately there's a simple command line tool `acdcontrol` which we can trigger in response to ACPI events.

**Pull and compile `acdcontrol`:**

	git submodule update --init
	(cd acdcontrol && make)

**Copy the necessary files into `/etc/acpi/` (requires root):**

	sudo cp events/acd-* /etc/acpi/events/
	sudo cp acdcontrol.sh acdcontrol/acdcontrol /etc/acpi/

**Restart `acpid`:**

	sudo systemctl restart acpid

If this doesn't work for you, use `acpi_listen` to check that these events are firing when you press your brightness up/down keys. You may just need to tweak the `event` string.
