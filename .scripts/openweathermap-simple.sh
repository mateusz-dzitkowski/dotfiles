#!/bin/sh

get_icon() {
    case $1 in
        # Icons for weather-icons
        01d) icon="";;
        01n) icon="";;
        02d) icon="";;
        02n) icon="";;
        03*) icon="";;
        04*) icon="";;
        09d) icon="";;
        09n) icon="";;
        10d) icon="";;
        10n) icon="";;
        11d) icon="";;
        11n) icon="";;
        13d) icon="";;
        13n) icon="";;
        50d) icon="";;
        50n) icon="";;
        *) icon="";
    esac

    echo $icon
}

KEY=$(pass openweathermap/key)
CITY="3081368"  # Wrocław
UNITS="metric"
SYMBOL="°"

API="https://api.openweathermap.org/data/2.5"

weather=$(curl -sf "$API/weather?appid=$KEY&id=$CITY&units=$UNITS")
if [ -n "$weather" ]; then
    weather_temp=$(echo "$weather" | jq ".main.temp" | cut -d "." -f 1)
    weather_temp_feels_like=$(echo "$weather" | jq ".main.feels_like" | cut -d "." -f 1)
    weather_icon=$(echo "$weather" | jq -r ".weather[0].icon")
    weather_pressure=$(echo "$weather" | jq -r ".main.pressure")

    echo "$(get_icon "$weather_icon")" "$weather_temp$SYMBOL" "($weather_temp_feels_like$SYMBOL)" "${weather_pressure}hPa"
fi
