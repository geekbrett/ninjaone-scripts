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
    $username = Ninja-Property-Get internaladminuser
    $password = Ninja-Property-Get internaladminpass
    $group = "Administrators"
    
    if($username -and $password) {
      if (!(Get-LocalUser | where {$_.name -eq $username})) {
        Write-output "Creating User: $username"
        New-LocalUser "$username" -Password (ConvertTo-SecureString -AsPlainText "$password" -Force) -AccountNeverExpires -PasswordNeverExpires
        Add-LocalGroupMember -Member "$username" -Group "$group"
      } else {
        Write-output "User: $username already exists, updating password"
        Set-LocalUser -Name "$username" -Password (ConvertTo-SecureString -AsPlainText "$password" -Force) -AccountNeverExpires:$true -PasswordNeverExpires:$true
      }
    } else {
      Write-Error "Username and/or password is not set in NinjaOne. Please set them and try again.";
      exit 1;
    }
}