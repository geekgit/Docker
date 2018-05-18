$ContainerName="win_net_td_docker"
$Docs=[Environment]::GetFolderPath("MyDocuments")
$ShareFolder=-join($Docs,"\",$ContainerName,"-share")
docker build -t $ContainerName $PSScriptRoot
Write-Host "Output directory: $ShareFolder"
New-Item -ItemType Directory -Force -Path $ShareFolder
$ID=& docker create $ContainerName
Write-Host "container id: $ID"
$SourcePath=-join($ID,":","C:\build\TdExample\TdExample.exe")
$DestPath=-join($ShareFolder,"/","TdExample.exe")
docker cp $SourcePath $DestPath
echo "docker removing container..."
docker rm -v $ID
echo "container removed."