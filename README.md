# USB RULER
This project is used to install some helpful USB rules. (ST-link, J-link, uart, arduino)

## Install and Reload
``` Shell
make
```

## Have some case USB Device Conflict with brltty
``` Shell
# Remove the brltty package
# Reload udev rules
make debug
```