#!/bin/bash

echo "Seeding the files..."

if [ ! -f /root/.do_not_init_me ]; then
    echo "Copying the initial files..."
    rm -rf /root/.* 2> /dev/null
    cp -pri /root_init/. /root/
else
    echo "Skipping the initial seeding!"
fi

echo "Running the main startup script..."

exec node /usr/local/share/xterm.js/app/app

