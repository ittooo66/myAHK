$RegConnect = [Microsoft.Win32.RegistryKey]::OpenRemoteBaseKey([Microsoft.Win32.RegistryHive]"CurrentUser","$env:COMPUTERNAME")


$RegCursors = $RegConnect.OpenSubKey("Control Panel\Cursors",$true)


#標準設定
$RegCursors.SetValue("","Windows Standard")
$RegCursors.SetValue("AppStarting","%SystemRoot%\cursors\aero_working.ani")
$RegCursors.SetValue("Arrow","%SystemRoot%\cursors\aero_arrow.cur")
#ContactVisualization
$RegCursors.SetValue("Crosshair","")
#GestureVisualization
$RegCursors.SetValue("Hand","%SystemRoot%\cursors\aero_link.cur")
$RegCursors.SetValue("Help","%SystemRoot%\cursors\aero_helpsel.cur")
$RegCursors.SetValue("IBeam","")
$RegCursors.SetValue("No","%SystemRoot%\cursors\aero_unavail.cur")
$RegCursors.SetValue("NWPen","%SystemRoot%\cursors\aero_pen.cur")
#Scheme Source
$RegCursors.SetValue("SizeAll","%SystemRoot%\cursors\aero_move.cur")
$RegCursors.SetValue("SizeNESW","%SystemRoot%\cursors\aero_nesw.cur")
$RegCursors.SetValue("SizeNS","%SystemRoot%\cursors\aero_ns.cur")
$RegCursors.SetValue("SizeNWSE","%SystemRoot%\cursors\aero_nwse.cur")
$RegCursors.SetValue("SizeWE","%SystemRoot%\cursors\aero_ew.cur")
$RegCursors.SetValue("UpArrow","%SystemRoot%\cursors\aero_up")
$RegCursors.SetValue("Wait","%SystemRoot%\cursors\aero_busy.ani")
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