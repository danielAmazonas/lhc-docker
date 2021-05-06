#!/bin/bash

read -p "Será realizada uma instalação nova, deseja continuar (s/n)? " choice
case "$choice" in
	s|S ) echo "Iniciando a instalação!" ; docker-compose down ; docker-compose build ; docker-compose up -d ; ./get_lhc_master.sh ; chown -R www-data: Live* ; mv Live*/lhc_web/* ./html/ ; rm -rf Live* ;;
	n|N ) echo "Saindo da instalação!" ; exit 0 ;;
	* )   echo "Saindo da instalação!" ; exit 0 ;;
esac
