$csc="C:\Windows\Microsoft.NET\Framework\v4.0.30319\csc.exe"
& $csc /define:RELEASE /optimize /t:exe /out:SomeApp.exe /r:Microsoft.VisualBasic.dll SomeApp.cs