ID=$(id -ur)
export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${ID}/bus"
