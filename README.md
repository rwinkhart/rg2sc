# rg2sc
Add iTunes Sound Check metadata from ReplayGain metadata.

You might want to do this for taking advantage of ReplayGain data on Apple devices, such as iPods.

The script can update individual files or directory structures. If the file already contains the Sound Check metadata, then it will not modify the file unless the -f option is used. That way you can periodically run the script on your entire collection and only the new MP3 files will be updated, saving a lot of space during incremental backups.

The "rgain3" Python package (https://github.com/chaudum/rgain3) can be used to generate the ReplayGain data used by this script.

There are a number of different possible formats to the ReplayGain metadata for MP3 files. The standard recommends that ID3v2 TXXX frames be used and that is what rg2sc uses.

This script is only tested on GNU/Linux, but it should also work on Windows.

# Dependencies

rg2sc depends on the "mutagen" Python package (https://mutagen.readthedocs.io/en/latest/).
