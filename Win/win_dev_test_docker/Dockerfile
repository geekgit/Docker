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
USER ContainerUser
RUN (New-Object System.Net.WebClient).DownloadFile('https://aka.ms/vs/15/release/vs_community.exe','vs_community.exe')
USER ContainerAdministrator
RUN Start-Process -FilePath 'vs_community.exe' -ArgumentList '--add Microsoft.VisualStudio.Component.VC.140', '--add Microsoft.VisualStudio.Component.VC.CoreIde', '--add Microsoft.Component.MSBuild', '--Quiet', '--Wait', '--NoRestart', '--NoUpdateInstaller' -Wait
RUN choco install -y visualcpp-build-tools 
RUN Start-Process -FilePath 'vs_community.exe' -ArgumentList '--add Microsoft.VisualStudio.Component.Windows10SDK', '--Quiet', '--Wait', '--NoRestart', '--NoUpdateInstaller' -Wait
RUN Start-Process -FilePath 'vs_community.exe' -ArgumentList '--add Microsoft.VisualStudio.Component.Windows10SDK.16299.Desktop', '--add Microsoft.VisualStudio.Component.Windows10SDK.16299.UWP', '--add Microsoft.VisualStudio.Component.Windows10SDK.16299.UWP.Native', '--Quiet', '--Wait', '--NoRestart', '--NoUpdateInstaller' -Wait
USER ContainerUser
RUN git clone https://github.com/Microsoft/vcpkg
WORKDIR 'C:\installers\vcpkg'
USER ContainerAdministrator
WORKDIR 'C:\Windows\system32\WindowsPowerShell\v1.0\Modules'
RUN mkdir fix
WORKDIR 'C:\Windows\system32\WindowsPowerShell\v1.0\Modules\fix'
ADD fix.psm1 fix.psm1
WORKDIR \
RUN Import-Module fix
# Link C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\MSBuild\15.0\Bin\ <-> C:\Program Files (x86)\MSBuild\14.0\Bin\
RUN New-Item -ItemType Directory -Force -Path 'C:\Program Files (x86)\MSBuild\14.0\'
WORKDIR 'C:\Program Files (x86)\MSBuild\14.0\'
RUN cmd /c mklink /d Bin 'C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\MSBuild\15.0\Bin'
RUN .\Bin\MSBuild.exe -version
WORKDIR 'C:\installers\vcpkg'
USER ContainerUser
# TODO: fix "C:\Common7\IDE\VC\VCTargets\Microsoft.Cpp.Default.props"
# Actually:
# C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\Common7\IDE\VC\VCTargets\Microsoft.Cpp.Default.props
# C:\Program Files (x86)\MSBuild\Microsoft.Cpp\v4.0\v140\Microsoft.Cpp.Default.props
# so...
WORKDIR 'C:\'
RUN ls
USER ContainerAdministrator
# C:\Common7\ <-> C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\Common7\
RUN cmd /c mklink /d Common7 'C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\Common7'
WORKDIR 'C:\installers\vcpkg'
USER ContainerUser
# Fail: error MSB6006: "CL.exe" exited with code -1073741515. [C:\installers\vcpkg\toolsrc\vcpkglib\vcpkglib.vcxproj]
RUN .\bootstrap-vcpkg.bat
#USER ContainerAdministrator
#RUN .\vcpkg integrate install
#RUN .\vcpkg integrate powershell
# run some admin stuff
#USER ContainerUser
#WORKDIR 'C:\build'
ENTRYPOINT ["powershell"]