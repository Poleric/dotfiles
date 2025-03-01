#!/bin/sh

stow --no-folding .

for serv in .config/systemd/user/*.{service,timer}
do
    systemctl enable --user "$(basename "$serv")"
done