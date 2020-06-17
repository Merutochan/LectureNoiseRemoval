; Select a folder to patch wav files to mp4 with identical names
; riccardo.straccia@studenti.unipr.it

#include <File.au3>
$f = FileSelectFolder("Select the video folder", @DesktopDir)

If @error Then
   Exit
EndIf

; Returns only mp4 files to array
$fl = _FileListToArray($f, "*.mp4", 1)

; Run ffmpeg command
For $i=1 To $fl[0]
   $a = StringTrimRight($fl[$i], 3) & "wav"
   RunWait("ffmpeg -i "&$fl[$i]&" -i "&$a&" -map 0:0 -map 1:0 -c:v copy -c:a aac -b:a 256k -shortest o_"&$fl[$i], $f)
Next




