function Test-Administrator  {  
    [OutputType([bool])]
    param()
    process {
        [Security.Principal.WindowsPrincipal]$user = [Security.Principal.WindowsIdentity]::GetCurrent();
        return $user.IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator);
    }
}
$ErrorActionPreference = "Stop";

if(-not (Test-Administrator)) {
    Write-Error "This script must be executed as Administrator.";
    exit 1;
} else {
    $RegistryPath = 'HKCU:\SOFTWARE\Policies\Microsoft\Edge'
    $Name = 'WebWidgetAllowed'
    $Name = '0'
    
    If (-NOT (Test-Path $RegistryPath)) {
        New-Item -Path $RegistryPath -Force | Out-Null
    }
    New-ItemProperty -Path $RegistryPath -Name $Name -Value $Value -PropertyType DWORD -Force
}