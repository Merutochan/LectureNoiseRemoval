; Select a folder to extract audio from all mp4 files to wav
; riccardo.straccia@studenti.unipr.it

#include <File.au3>
$f = FileSelectFolder("Select the video folder", @DesktopDir)

If @error Then
   Exit
EndIf

; Returns only mp4 files to array
$fl = _FileListToArray($f, "*.mp4", 1 )

; For each file, run ffmpeg command
For $i=1 To $fl[0]
   $a = StringTrimRight($fl[$i], 3) & "wav"
   RunWait("ffmpeg -i "&$fl[$i]&" "&$a, $f)
Next