FROM microsoft/dotnet-framework:4.7.2-runtime
MAINTAINER geekgit
USER ContainerAdministrator
RUN rd /S /Q "C:\Program Files\WindowsPowerShell\Modules\PSReadLine"
SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop';"]
RUN Set-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters' -Name ServerPriorityTimeLimit -Value 0 -Type DWord
USER ContainerUser
RUN mkdir installers
RUN mkdir apps
WORKDIR installers
RUN (New-Object System.Net.WebClient).DownloadFile('https://www.7-zip.org/a/7z1805-x64.msi','7zip.msi')
ADD admin-check.ps1 admin-check.ps1
ADD dns.ps1 dns.ps1
USER ContainerAdministrator
RUN ./admin-check.ps1
RUN Start-Process -FilePath '7zip.msi' -ArgumentList '/quiet', '/NoRestart' -Wait
RUN [Environment]::SetEnvironmentVariable('Path', $env:Path + ';C:\Program Files\7-Zip', [EnvironmentVariableTarget]::Machine)
USER ContainerUser
WORKDIR 'C:\apps'
ADD SomeApp.7z SomeApp.7z
RUN 7z x SomeApp.7z
WORKDIR 'C:\apps\SomeApp'
RUN ./SomeApp.exe
WORKDIR 'C:\apps'
ENTRYPOINT ["powershell"]