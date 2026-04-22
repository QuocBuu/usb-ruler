# USB RULER
This project is used to install some helpful USB rules. (ST-link, J-link, uart, arduino)

## Clone sources
``` Shell
git clone https://github.com/QuocBuu/usb-ruler.git
cd usb-ruler
```

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
