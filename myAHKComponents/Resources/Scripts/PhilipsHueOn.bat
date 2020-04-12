set /a bri=254
set curl="C:\Program Files\curl\src\curl.exe"

if not "%1" == "" (
	set bri=%1
)

%curl% -X PUT http://192.168.10.20/api/wYcnCswCImWhoyfzFtGKhVgsS-W8H6J1S1LjcVbq/lights/1/state -d "{\"on\":true,\"bri\":%bri%}"
%curl% -X PUT http://192.168.10.20/api/wYcnCswCImWhoyfzFtGKhVgsS-W8H6J1S1LjcVbq/lights/2/state -d "{\"on\":true,\"bri\":%bri%}"
%curl% -X PUT http://192.168.10.20/api/wYcnCswCImWhoyfzFtGKhVgsS-W8H6J1S1LjcVbq/lights/3/state -d "{\"on\":true,\"bri\":%bri%}"
