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
    
}

Function Remove-AppX([String]$appName) {
    $app = Get-AppxPackage -AllUsers $appName
    if($app -ne $null){
        Write-Host "$appName is installed on this computer"
        $PackageFullName = $app.PackageFullName
        $ProPackageFullName = (Get-AppxProvisionedPackage -Online | where {$_.Displayname -eq $appName}).DisplayName
        if($PackageFullName) {
          Write-Host " - Removing Package: $app"
          remove-AppxPackage -package $PackageFullName
        }
        #if($ProPackageFullName) {
        #  Write-Host " - Removing Provisioned Package: $ProPackageFullName"
        #  Remove-AppxProvisionedPackage -online -packagename $ProPackageFullName -allusers
        #}
    }
    else{
        Write-Host "$appName is not installed on this computer"
    }
}

# General Bloat
Remove-AppX "Clipchamp.Clipchamp"
Remove-AppX "SpotifyAB.SpotifyMusic"
Remove-AppX "DropboxInc.Dropbox"
Remove-AppX "*Disney.*"
Remove-AppX "Disney.37853FC22B2CE"
Remove-AppX "9E2F88E3.Twitter"
Remove-AppX "AMZNMobileLLC.KindleforWindows8"
Remove-AppX "GoogleInc.GoogleSearch"
Remove-AppX "4DF9E0F8.Netflix"
Remove-AppX "AmazonVideo.PrimeVideo"
Remove-AppX "FACEBOOK.317180B0BB486"
Remove-AppX "ThumbmunkeysLtd.PhototasticCollage"
Remove-AppX "C27EB4BA.DropboxOEM"
#Remove-AppX "Windows.CBSPreview"
Remove-AppX "Evernote.Evernote"
Remove-AppX "7EE7776C.LinkedInforWindows"

# Microsoft Bloat
Remove-AppX "Microsoft.BingNews"
Remove-AppX "Microsoft.BingWeather"
Remove-AppX "Microsoft.News"
Remove-AppX "Microsoft.BingFoodAndDrink"
Remove-AppX "Microsoft.BingTravel"
Remove-AppX "Microsoft.BingHealthAndFitness"
Remove-AppX "Microsoft.BingSports"
Remove-AppX "Microsoft.BingFinance"
Remove-AppX "Microsoft.BingTranslator"
Remove-AppX "Microsoft.BingSearch"
Remove-AppX "Microsoft.GetHelp"
#Remove-AppX "Microsoft.SkypeApp"
Remove-AppX "MicrosoftCorporationII.MicrosoftFamily"
Remove-AppX "MSTeams"
Remove-AppX "MicrosoftTeams"
Remove-AppX "Microsoft.3DBuilder"
Remove-AppX "Microsoft.Microsoft3DViewer"
Remove-AppX "Microsoft.WindowsFeedbackHub"
Remove-AppX "Microsoft.Getstarted"
Remove-AppX "Microsoft.Messaging"
Remove-AppX "Microsoft.MicrosoftOfficeHub"
Remove-AppX "Microsoft.Office.OneNote"
Remove-AppX "Microsoft.GamingApp"
Remove-AppX "Microsoft.YourPhone"
Remove-AppX "Microsoft.WindowsMaps"
#Remove-AppX "Microsoft.MixedReality.Portal"
Remove-AppX "Microsoft.OneDriveSync"
Remove-AppX "Microsoft.WindowsDVDPlayer"
Remove-AppX "Microsoft.Wallet"
Remove-AppX "*DevHome*"
#Remove-AppX "Microsoft.XboxApp"                                           # Doesn't Work
#Remove-AppX "Microsoft.XboxGameOverlay"                                   # Doesn't Work
#Remove-AppX "Microsoft.XboxGamingOverlay"                                 # Doesn't Work
#Remove-AppX "Microsoft.XboxSpeechToTextOverlay"                           # Doesn't Work
#Remove-AppX "Microsoft.Xbox.TCUI"                                         # Doesn't Work
#Remove-AppX "Microsoft.XboxIdentityProvider"                              # Doesn't Work
#Remove-AppX "Microsoft.XboxGameCallableUI"                                # Doesn't Work

# McAfee
Remove-AppX "5A894077.McAfeeSecurity"
Remove-AppX "McAfeeWPSSparsePackage"

# Games
Remove-AppX "Microsoft.MinecraftEducationEdition"
Remove-AppX "26720RandomSaladGamesLLC.SimpleSolitaire"
Remove-AppX "Microsoft.MicrosoftSolitaireCollection"
Remove-AppX "Microsoft.MicrosoftMahjong"
Remove-AppX "king.com.CandyCrushFriends"
Remove-AppX "king.com.CandyCrushSodaSaga"
Remove-AppX "king.com.CandyCrushSaga"
Remove-AppX "22741LiliGames.AdventureofStars"

# HP Bloat
Remove-AppX "AD2F1837.HP"
Remove-AppX "AD2F1837.HPSupportAssistant"
Remove-AppX "AD2F1837.myHP"
Remove-AppX "AD2F1837.HPSystemEventUtility"
Remove-AppX "AD2F1837.HPThermalControl"
Remove-AppX "AD2F1837.OMENCommandCenter"
Remove-AppX "AD2F1837.HPEnhance"
Remove-AppX "AD2F1837.HPInc.EnergyStar"
Remove-AppX "AD2F1837.HPPrivacySettings"
Remove-AppX "AD2F1837.HPAudioCenter"
Remove-AppX "AD2F1837.HPRegistration"
Remove-AppX "AD2F1837.HPGames"
Remove-AppX "AD2F1837.HPConnectedPhotopoweredbySnapfish"

# Dell Bloat
Remove-AppX "DellInc.MyDell"
Remove-AppX "DellInc.DellUpdate"
Remove-AppX "DellInc.DellHelpSupport"
Remove-AppX "DellInc.DellShop"
Remove-AppX "DellInc.DellCustomerConnect"
Remove-AppX "DellInc.DellDigitalDelivery"
Remove-AppX "DellInc.DellProductRegistration"
Remove-AppX "DellInc.DellSupportAssistforPCs"
Remove-AppX "DB6EA5DB.Power2GoforDell"
Remove-AppX "DB6EA5DB.PowerDirectorforDell"
Remove-AppX "DB6EA5DB.PowerMediaPlayerforDell"
Remove-AppX "RivetNetworks.SmartByte"
Remove-AppX "WavesAudio.MaxxAudioProforDell2021"

# Lenovo Bloat

# Acer Bloat
Remove-AppX "AcerIncorporated.AcerCollectionS"
Remove-AppX "AcerIncorporated.AcerCareCenterS"
Remove-AppX "AcerIncorporated.AcerRegistration"