$csc="C:\Windows\Microsoft.NET\Framework\v4.0.30319\csc.exe"
& $csc -platform:x86 /define:RELEASE /optimize /t:exe /out:TdExample.exe /r:Telegram.Td.dll TdExample.cs