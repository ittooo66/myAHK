$RegConnect = [Microsoft.Win32.RegistryKey]::OpenRemoteBaseKey([Microsoft.Win32.RegistryHive]"CurrentUser","$env:COMPUTERNAME")


$RegCursors = $RegConnect.OpenSubKey("Control Panel\Cursors",$true)


#黒設定
$RegCursors.SetValue("","Windows Black")
$RegCursors.SetValue("AppStarting","%SystemRoot%\cursors\wait_r.cur")
$RegCursors.SetValue("Arrow","%SystemRoot%\cursors\arrow_r.cur")
#ContactVisualization
$RegCursors.SetValue("Crosshair","%SystemRoot%\cursors\cross_r.cur")
$RegCursors.SetValue("CursorBaseSize",0x40)
#GestureVisualization
$RegCursors.SetValue("Hand","")
$RegCursors.SetValue("Help","%SystemRoot%\cursors\help_r.cur")
$RegCursors.SetValue("IBeam","%SystemRoot%\cursors\beam_r.cur")
$RegCursors.SetValue("No","%SystemRoot%\cursors\no_r.cur")
$RegCursors.SetValue("NWPen","%SystemRoot%\cursors\pen_r.cur")
$RegCursors.SetValue("Person","%SystemRoot%\cursors\person_r.cur")
$RegCursors.SetValue("Pin","%SystemRoot%\cursors\pin_r.cur")
#Scheme Source
$RegCursors.SetValue("SizeAll","%SystemRoot%\cursors\move_r.cur")
$RegCursors.SetValue("SizeNESW","%SystemRoot%\cursors\size1_r.cur")
$RegCursors.SetValue("SizeNS","%SystemRoot%\cursors\size4_r.cur")
$RegCursors.SetValue("SizeNWSE","%SystemRoot%\cursors\size2_r.cur")
$RegCursors.SetValue("SizeWE","%SystemRoot%\cursors\size3_r.cur")
$RegCursors.SetValue("UpArrow","%SystemRoot%\cursors\up_r.cur")
$RegCursors.SetValue("Wait","%SystemRoot%\cursors\busy_r.cur")
$RegCursors.Close()
$RegConnect.Close()

function Update-UserPreferencesMask {
$Signature = @"
[DllImport("user32.dll", EntryPoint = "SystemParametersInfo")]
public static extern bool SystemParametersInfo(uint uiAction, uint uiParam, uint pvParam, uint fWinIni);

const int SPI_SETCURSORS = 0x0057;
const int SPIF_UPDATEINIFILE = 0x01;
const int SPIF_SENDCHANGE = 0x02;

public static void UpdateUserPreferencesMask() {
    SystemParametersInfo(SPI_SETCURSORS, 0, 0, SPIF_UPDATEINIFILE | SPIF_SENDCHANGE);
}
"@
    Add-Type -MemberDefinition $Signature -Name UserPreferencesMaskSPI -Namespace User32
    [User32.UserPreferencesMaskSPI]::UpdateUserPreferencesMask()
}
Update-UserPreferencesMask