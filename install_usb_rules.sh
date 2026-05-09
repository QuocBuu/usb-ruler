#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
FILE_RULES="usb-conf.rules"
UDEV_DIR="/etc/udev/rules.d"
RULES_SOURCE="${SCRIPT_DIR}/${FILE_RULES}"
RULES_TARGET="${UDEV_DIR}/${FILE_RULES}"

usage() {
	printf 'Usage: %s [--remove-brltty]\n' "$(basename "$0")"
	printf '\n'
	printf 'Options:\n'
	printf '  --remove-brltty  Remove brltty before reloading udev rules.\n'
	printf '  -h, --help       Show this help message.\n'
}

REMOVE_BRLTTY=0

for arg in "$@"; do
	case "$arg" in
		--remove-brltty)
			REMOVE_BRLTTY=1
			;;
		-h|--help)
			usage
			exit 0
			;;
		*)
			printf 'Unknown option: %s\n\n' "$arg" >&2
			usage >&2
			exit 1
			;;
	esac
done

if [[ ! -f "$RULES_SOURCE" ]]; then
	printf 'Cannot find %s\n' "$RULES_SOURCE" >&2
	exit 1
fi

if [[ "$REMOVE_BRLTTY" -eq 1 ]]; then
	if command -v apt >/dev/null 2>&1 && dpkg -s brltty >/dev/null 2>&1; then
		printf 'Remove brltty to avoid USB serial conflict\n'
		sudo apt remove -y brltty
	else
		printf 'Skip brltty removal: apt/brltty not found\n'
	fi
fi

printf 'Install %s into %s\n' "$FILE_RULES" "$UDEV_DIR"
sudo install -m 0644 "$RULES_SOURCE" "$RULES_TARGET"

printf 'Reload udev rules\n'
sudo udevadm control --reload-rules
sudo udevadm trigger

printf 'Done. Replug your USB device if it is already connected.\n'
