$ContainerName="tdlib1.4.0_build_docker"
$Docs=[Environment]::GetFolderPath("MyDocuments")
$ShareFolder=-join($Docs,"\",$ContainerName,"-share")
docker build -t $ContainerName $PSScriptRoot
Write-Host "Output directory: $ShareFolder"
New-Item -ItemType Directory -Force -Path $ShareFolder
$ID=& docker create $ContainerName
Write-Host "container id: $ID"
echo "docker removing container..."
$SourcePath=-join($ID,":","/home/build/tdlib.7z")
$DestPath=-join($ShareFolder,"/","tdlib.7z")
docker cp $SourcePath $DestPath
docker rm -v $ID
echo "container removed."
