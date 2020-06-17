# Lecture Noise Removal
*A simple chain to automate the removal of background noise from videolectures recording.*


## How to use
1. Make sure you have both [**ffmpeg**](https://ffmpeg.org/) and [**Audacity**](https://www.audacityteam.org/download/) installed. If you download ffmpeg's binaries, make sure the folder which contains them is correctly set in your PATH env. variable so that you can use the command ```ffmpeg``` from CLI.

2. If you're in Windows, you may download the Autoit scripts (if you don't have the Autoit compiler and 'interpreter' installed, binaries may be found in the release section). Otherwise, download the Python ported versions (which should however work in Windows, too).

3. Download the ```Lecture Noise Reduction.txt``` file and put it in the Audacity Macro folder.

 * In Windows, the folder is located in ```%Appdata%\audacity\Macros```.
 * In Linux, the folder should be located in ```~/.audacity-data\Macros```. 

4. If using the Autoit version, run the **Extract Audio** script/exe and select the folder containing the .mp4 files of the lectures

5. Once all the audio is extracted, open one of the audio files with audacity and isolate a 5-6 seconds long audio slice containing only noise. Proceed to export the selected slice to a WAV audio file with a name that makes it alphabetically the first file in the folder (e.g. ```AAA_noise_sample.wav```). This way the Audacity macro will open it first.

6. Open Audacity and select ```Tools->Macros```. Select the ```Lecture Noise Reduction macro``` and click on 'Files' to select multiple files. Select **all** the audio files, *including the noise sample just created*. It should appear as first of the list. If not, Audacity won't apply the procedure correctly.

7. At this point in a lenghty procedure, Audacity will do the following for each file:
 - Attempt to attenuate the noise based on the spectrum of your selected noise sample. **If the spectral content of your noise is different among the various files** (i.e. depending on the room it was recorded in) **you may want to repeat the procedure trying to isolate the different noise footprints** or else some audio files won't be properly polished. 
 - After the spectral attenuation, a noise gate is applied to remove the remaining low-level noise. Threshold and decay parameters may be modified to your preferences and needs.
 - Normalization is finally applied to boost the audio level (useful if the first step happened to lower the general level). Dynamics are untouched here (no compression).
 - Export to WAV.

8. At this point, a folder is created containing the output of the macro. Analyze by ear the audio files, saving those you find to be clear enough and repeating the procedure from step 5 for those whose noise wasn't properly removed.

9. Once you have all the corrected WAV files ready, put them back into the folder containing the MP4 files and run the **Substitute Audio** script/exe. It will convert each audio file to aac and substitute it into the video (without video re-encoding).
