#Use this file to start the deployment of your Jenkins Pipeline Build Server

#Copy required DSC resources to local machine

Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force
Save-Module -Name cChoco -Path 'C:\Program Files (x86)'
Install-Module -Name cChoco


