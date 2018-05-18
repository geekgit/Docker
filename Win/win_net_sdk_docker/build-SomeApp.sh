#!/bin/bash
mono-csc /define:RELEASE /optimize /t:exe /out:SomeApp.exe /r:Microsoft.VisualBasic.dll SomeApp.cs