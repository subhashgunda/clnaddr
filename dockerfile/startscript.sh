#!/bin/sh
echo "Updating clnaddrws.ini file"
if [ -z "${PORT}" ]; then
        echo "Port value is null so choosing the default value"
        PORT=8080
        echo "Default port is: $PORT"
else
        echo "Custom port: $PORT is assigned"
fi
cat /clnaddr/bin/clnaddrws.ini | sed -e s/8097/$PORT/ | sed -e s/localhost/0.0.0.0/ | sed -e 's/LogLevel              = 6/LogLevel              = 5/' | sed -e 's/OutputLevel           = 6/OutputLevel           = 5/' > /clnaddr/bin/clnaddrws_temp.ini
mv /clnaddr/bin/clnaddrws_temp.ini /clnaddr/bin/clnaddrws.ini
#cat /clnaddr/bin/cron_profile | sed -e 's/. oraenv/#. oraenv/' > /clnaddr/bin/cron_profile_temp
#mv /clnaddr/bin/cron_profile_temp /clnaddr/bin/cron_profile
dir=/clnaddr/bin
source $dir/cron_profile
exec $dir/clnaddrws clnaddrws.ini


