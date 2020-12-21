
if %1 gtr 508 (
	set on1=true
	set on2=true
	set on3=true
	set /a bri1=%1-508
	set /a bri2=254
	set /a bri3=254
) else if %1 gtr 254 (
	set on1=false
	set on2=true
	set on3=true
	set /a bri1=0
	set /a bri2=%1-254
	set /a bri3=254
) else (
	set on1=false
	set on2=false
	set on3=true
	set /a bri1=0
	set /a bri2=0	
	set bri3=%1
)

if not "%2" == "" (
	set ct=%2
)

curl -X PUT http://192.168.10.20/api/wYcnCswCImWhoyfzFtGKhVgsS-W8H6J1S1LjcVbq/lights/1/state -d "{\"on\":%on1%,\"bri\":%bri1%,\"ct\":%ct%}"
curl -X PUT http://192.168.10.20/api/wYcnCswCImWhoyfzFtGKhVgsS-W8H6J1S1LjcVbq/lights/2/state -d "{\"on\":%on2%,\"bri\":%bri2%,\"ct\":%ct%}"
curl -X PUT http://192.168.10.20/api/wYcnCswCImWhoyfzFtGKhVgsS-W8H6J1S1LjcVbq/lights/3/state -d "{\"on\":%on3%,\"bri\":%bri3%,\"ct\":%ct%}"
