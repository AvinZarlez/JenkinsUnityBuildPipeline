## Use this file to start the deployment of your Jenkins Pipeline Build Server ##
## Without modification, this deployment will build:           ##
##              Windows Server 2012 R2 with:                   ##
##                   Visual Studio Community - 2015 Update 3   ##
##                   Jenkins 2.19.4                            ##
##                   Unity 5.4.1                               ##
##                   Git 2.11.0                                ##



# Step 1 #
# Connect to Your Azure Subscription and create required resources #

Login-AzureRmAccount
Get-AzureRmSubscription
$VSSubID = "8bae2860-xxxx-4614-xxxx-60e97f4248dc"  ## replace with your Sub ID ##
Set-AzureRmContext -SubscriptionID $VSSubID

$RGName = "BuildServerXXX"   
New-AzureRmResourceGroup -Name $RGName -Location "West US" 

# Step 1.5 #
# If you need to edit the default installation of software from what is listed above, you will need to fork the GitHub repo and regenerate the DSC .zip file.
# Edit the "BuildServerDSCconfig.ps1" file to include what software you need, then regenerate the zip file using the PowerShell below. 

Publish-AzureRmVMDscConfiguration "C:\Users\jcroth\Documents\GitHub\JenkinsUnityBuildPipeline\BuildServerDSCconfig.ps1" -OutputArchivePath "C:\Users\jcroth\Documents\GitHub\JenkinsUnityBuildPipeline\BuildServerDSCconfig.ps1.zip" -Force

# Step 2 #
# Set the variable to deploy the server template #
# You will be deploying directly from Github, this URL leads to our default installation - https://github.com/TobiahZ/JenkinsUnityBuildPipeline/blob/master/buildserverdeploy.json"
# Otherwise, use a URL for your own forked repo.

$assetLocation = "https://raw.githubusercontent.com/TobiahZ/JenkinsUnityBuildPipeline/master/" 
$templateFileLoc  = $assetLocation + "buildserverdeploy.json" 

# Step 3 #
# Deploy the build server to your Azure Subscription #

New-AzureRmResourceGroupDeployment -ResourceGroupName $RGName -TemplateUri $templateFileLoc -verbose

