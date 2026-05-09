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

## Auto Install
``` Shell
chmod +x auto.sh
./install_usb_rules.sh
```

## Have some case USB Device Conflict with brltty
``` Shell
# Remove the brltty package
# Reload udev rules
make debug
```

Or use the auto script:
``` Shell
./install_usb_rules.sh --remove-brltty
```
