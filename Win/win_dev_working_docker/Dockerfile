FROM microsoft/windowsservercore:1803
MAINTAINER geekgit
USER ContainerAdministrator
RUN rd /S /Q "C:\Program Files\WindowsPowerShell\Modules\PSReadLine"
SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop';"]
RUN Set-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters' -Name ServerPriorityTimeLimit -Value 0 -Type DWord
USER ContainerUser
RUN mkdir installers
RUN mkdir build
WORKDIR installers
RUN (New-Object System.Net.WebClient).DownloadFile('https://www.7-zip.org/a/7z1805-x64.msi','7zip.msi')
RUN (New-Object System.Net.WebClient).DownloadFile('https://chocolatey.org/install.ps1','chocolatey-install.ps1')
RUN ls
ADD admin-check.ps1 admin-check.ps1
ADD dns.ps1 dns.ps1
USER ContainerAdministrator
RUN ./admin-check.ps1
RUN Start-Process -FilePath '7zip.msi' -ArgumentList '/quiet', '/NoRestart' -Wait
RUN [Environment]::SetEnvironmentVariable('Path', $env:Path + ';C:\Program Files\7-Zip', [EnvironmentVariableTarget]::Machine)
RUN Install-PackageProvider -Name 'Nuget' -Force
RUN Install-Module -Name 'PowerShellGet' -Force
RUN [Environment]::SetEnvironmentVariable('chocolateyUseWindowsCompression','false',[EnvironmentVariableTarget]::Machine)
RUN powershell.exe -NoProfile -InputFormat None -ExecutionPolicy Bypass ./chocolatey-install.ps1
RUN Write-Host "Test"
RUN Install-PackageProvider ChocolateyGet -Force
RUN Import-PackageProvider ChocolateyGet -Force
RUN Find-Package -ProviderName ChocolateyGet -name nodejs
RUN Install-Package -ProviderName ChocolateyGet -name nodejs -Force
RUN Install-Package -ProviderName ChocolateyGet -name cmake -Force
RUN [Environment]::SetEnvironmentVariable('Path', $env:Path + ';C:\Program Files\CMake\bin', [EnvironmentVariableTarget]::Machine)
USER ContainerUser
RUN (New-Object System.Net.WebClient).DownloadFile('https://netcologne.dl.sourceforge.net/project/gnuwin32/gperf/3.0.1/gperf-3.0.1.exe','gperf-setup.exe')
USER ContainerAdministrator
RUN Start-Process -FilePath 'gperf-setup.exe' -ArgumentList '/VerySilent','/SuppressMsgBoxes','/NoRestart' -Wait
RUN [Environment]::SetEnvironmentVariable('Path', $env:Path + ';C:\Program Files (x86)\GnuWin32\bin', [EnvironmentVariableTarget]::Machine)
RUN Install-Package -ProviderName ChocolateyGet -name git -Force
RUN Install-Package -ProviderName ChocolateyGet -name visualcpp-build-tools -Force
# run some admin stuff
USER ContainerUser
WORKDIR 'C:\build'
ENTRYPOINT ["powershell"]