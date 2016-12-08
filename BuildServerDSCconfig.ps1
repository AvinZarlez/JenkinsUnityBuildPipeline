Configuration BuildServer            
{            
    Import-DscResource -ModuleName PSDesiredStateConfiguration, cChoco, xSystemSecurity          
    Node localhost            
    {       
        WindowsFeature NETFramework35
        {
        Ensure = "Present"
        Name = "NET-Framework-Features"
    }
       cChocoInstaller installChoco
      {
        InstallDir = "C:\Program Files (x86)\choco"
      }
      cChocoPackageInstaller installGit
      {
         Ensure = 'Present'
         Name = "git"
         DependsOn = "[cChocoInstaller]installChoco"
      }
      xIEEsc EnableIEEscAdmin
        {
            IsEnabled = $True
            UserRole  = "Administrators"
        }
        xIEEsc EnableIEEscUser
        {
            IsEnabled = $False
            UserRole  = "Users"
        }

    }
}