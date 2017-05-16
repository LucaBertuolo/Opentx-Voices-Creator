# Opentx-Voices-Creator
Requirement:
- Linux OS
- gTTS from: https://github.com/pndurette/gTTS
- CSV voices list from: http://downloads.open-tx.org/2.1/voices/
- FFMPEG
- Internet conenction

# How to use:
In a folder place this script and the CSV voices list listed above and rename it to "voices.csv"
You can change the language in the script by editing the line 25 like this:
- LANG="it"
- LANG="en"
- LANG="de"

Run the script from command line:
- sh OpenTXVoicesCreator.sh
if it does not start make it executable with:
- chmod +x OpenTXVoicesCreator.sh

In a few minutes, you will have a SOUND directory with all the voices for your radio pronuncied by the Google TTS

# How to add new voices:
If you need new voices, you can edit the CSV file in Excel/Calc adding a new line and editing the namefile and the text that you wold that the radio will pronunce, then run the script again

The resulting Audio file are converted in WAV and it's totally comaptibile with OpenTX Standard
