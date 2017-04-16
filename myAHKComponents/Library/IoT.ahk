IoT_coolerOn(){
	script := A_WorkingDir . "\myAHKComponents\Resources\IoT\CoolerOn.bat"
	run, %script%
}
IoT_coolerOff(){
	script := A_WorkingDir . "\myAHKComponents\Resources\IoT\CoolerOff.bat"
	run, %script%
}
