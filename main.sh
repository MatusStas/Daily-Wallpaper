#!/bin/bash

set_photo () {
	wget -q http://api.unsplash.com/photos/random/?client_id=66bdd6c5cb98b3d4f4a9b28e230d93b1a06aa8af96486f24d2a5fe0159daab52

	mv index* api
	python3 get_photo_from_api.py

	sleep 10
	mv photo* wallpaper

	gsettings set org.gnome.desktop.background picture-options 'scaled'
	gsettings set org.gnome.desktop.background picture-uri /home/matusstas/Projects/EveryDayWallpaper/wallpaper
	echo $(date '+%y-%d-%m') >> datums
}

check_connectivity () {
	wget -q --spider https://www.google.com/

	if [[ $? -eq 0 ]]; then
		return="1"
	else
		return="0"
	fi
}

main () {
	check_connectivity
	connection=$(echo $return)

	if [[ "$connection" == "1" ]]; then
		time=$(date '+%H%M')
		if [[ "$time" == "1200" ]]; then
			set_photo
		else
			if [[ "$time" > "1200" ]]; then
				datum=$(cat datums | tail -1)
				if [[ "$datum" != "$(date '+%y-%d-%m')" ]]; then
					set_photo
				fi
			fi
		fi
	fi
}

main