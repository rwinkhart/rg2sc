# rg2sc
Add iTunes SoundCheck metadata from ReplayGain metadata in both .m4a/.mp4 and .mp3 containers.

You might want to do this for taking advantage of ReplayGain data on Apple devices, such as iPods.

The script can update individual files or directory structures. If the file already contains the SoundCheck metadata, then it will not modify the file unless the -f option is used. That way you can periodically run the script on your entire collection and only the new files will be updated, saving a lot of space during incremental backups.

The "rgain3" Python package (https://github.com/chaudum/rgain3) can be used to generate the ReplayGain data used by this script.

Please note that rg2sc only support ID3v2 TXXX frames when converting .mp3 tags. If using rgain3 to generate your ReplayGain data, this is of no concern to you.

This script is only tested on GNU/Linux, but it should also work on Windows (at least for .mp3, .m4a/.mp4 is completely untested under Windows).

# Dependencies

rg2sc depends on the "mutagen" Python package (https://mutagen.readthedocs.io/en/latest/).
