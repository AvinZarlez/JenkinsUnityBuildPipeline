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

     cChocoPackageInstaller installJenkins
      {
         Ensure = 'Present'
         Name = "jenkins"
         DependsOn = "[cChocoInstaller]installChoco"
      }
      cChocoPackageInstaller installUnity
      {
         Ensure = 'Present'
         Name = "unity"
         DependsOn = "[cChocoInstaller]installChoco"
      }
      xIEEsc EnableIEEscAdmin
        {
            IsEnabled = $False
            UserRole  = "Administrators"
        }
        xIEEsc EnableIEEscUser
        {
            IsEnabled = $True
            UserRole  = "Users"
        }

    }
}
