FROM microsoft/dotnet-framework:4.7.2-sdk
MAINTAINER geekgit
USER ContainerAdministrator
SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop';"]
RUN Set-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters' -Name ServerPriorityTimeLimit -Value 0 -Type DWord
USER ContainerUser
RUN mkdir installers
RUN mkdir build
WORKDIR installers
RUN (New-Object System.Net.WebClient).DownloadFile('https://www.7-zip.org/a/7z1805-x64.msi','7zip.msi')
ADD admin-check.ps1 admin-check.ps1
ADD dns.ps1 dns.ps1
USER ContainerAdministrator
RUN ./admin-check.ps1
RUN Start-Process -FilePath '7zip.msi' -ArgumentList '/quiet', '/NoRestart' -Wait
RUN [Environment]::SetEnvironmentVariable('Path', $env:Path + ';C:\Program Files\7-Zip', [EnvironmentVariableTarget]::Machine)
USER ContainerUser
WORKDIR 'C:\build'
RUN mkdir SomeApp
WORKDIR 'C:\build\SomeApp'
ADD SomeApp.cs SomeApp.cs
ADD build-SomeApp.sh build-SomeApp.sh
ADD build-SomeApp.ps1 build-SomeApp.ps1
RUN .\build-SomeApp.ps1
ENTRYPOINT ["powershell"]