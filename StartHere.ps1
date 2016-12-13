## Use this file to start the deployment of your Jenkins Pipeline Build Server ##

# Step 1 #
# Copy and edit the "buildserver.paramenters.json" file to have names globally unique names for your deployment
# Save the file to a convienent location on your local machine

# Step 2 #
# Connect to Your Azure Subscription and create required resources #

Login-AzureRmAccount
Get-AzureRmSubscription
$VSSubID = "8bae2860-70c1-4614-xxxx-60e97f4248dc"
Set-AzureRmContext -SubscriptionID $VSSubID

$RGName = "BuildServer"   
New-AzureRmResourceGroup -Name $RGName -Location "West US" 

# Step 3 #
# Set the variable to deploy the server template #
# You will be deploying directly from Github - https://github.com/TobiahZ/JenkinsUnityBuildPipeline/blob/master/buildserverdeploy.json""

$assetLocation = "https://github.com/TobiahZ/JenkinsUnityBuildPipeline/blob/master/" 
$templateFileLoc  = $assetLocation + "buildserverdeploy.json" 
$parameterFileLoc = "C:\users\jcroth\Desktop\jennelle.parameters.json"

# Step 4 #
# Deploy the build server to your Azure Subscription #

New-AzureRmResourceGroupDeployment -ResourceGroupName $RGName -TemplateParameterFile $parameterFileLoc -TemplateUri $templateFileLoc -verbose


