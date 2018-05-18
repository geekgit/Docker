$ContainerName="win_net_sdk_docker"
$Docs=[Environment]::GetFolderPath("MyDocuments")
$ShareFolder=-join($Docs,"\",$ContainerName,"-share")
docker build -t $ContainerName $PSScriptRoot
Write-Host "Output directory: $ShareFolder"
New-Item -ItemType Directory -Force -Path $ShareFolder
$ID=& docker create $ContainerName
Write-Host "container id: $ID"
echo "docker removing container..."
#$SourcePath=-join($ID,":","/home/build/SomeApp/SomeApp.exe")
#$DestPath=-join($ShareFolder,"/","SomeApp.exe")
#docker cp $SourcePath $DestPath
docker rm -v $ID
echo "container removed."