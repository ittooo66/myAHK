IoT_PhilipsHueOn(){
	script := A_WorkingDir . "\myAHKComponents\Resources\IoT\PhilipsHueOn.bat"
	run, %script%
}IoT_PhilipsHueOff(){
	script := A_WorkingDir . "\myAHKComponents\Resources\IoT\PhilipsHueOff.bat"
	run, %script%
}
