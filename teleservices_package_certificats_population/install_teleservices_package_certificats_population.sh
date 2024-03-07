#!/bin/sh

set -e # Exit immediately if a command exits with a non-zero status.

# installation path
install_path="/usr/lib/teleservices_package_certificats_population"

echo "--- Install passerelle settings certificats population"
if [ ! -f "/etc/passerelle/settings.d/certificats_population.py" ] || [ ! -s "/etc/passerelle/settings.d/certificats_population.py" ]; then
  cp $install_path/passerelle/certificats_population.py /etc/passerelle/settings.d/
fi

service passerelle restart

sudo -u hobo hobo-manage imio_indus_deploy --directory $install_path