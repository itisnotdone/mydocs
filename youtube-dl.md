# List available formats
```bash
youtube-dl -F URL
[youtube] BLAHBLAHBLAH: Downloading webpage
[youtube] BLAHBLAHBLAH: Downloading video info webpage
[youtube] BLAHBLAHBLAH: Extracting video information
WARNING: unable to extract uploader nickname
[info] Available formats for BLAHBLAHBLAH:
format code  extension  resolution note
249          webm       audio only DASH audio   73k , opus @ 50k, 87.29MiB
250          webm       audio only DASH audio   91k , opus @ 70k, 114.12MiB
171          webm       audio only DASH audio  126k , vorbis@128k, 164.59MiB
140          m4a        audio only DASH audio  140k , m4a_dash container, mp4a.40.2@128k, 196.77MiB
251          webm       audio only DASH audio  165k , opus @160k, 221.49MiB
160          mp4        256x144    144p   72k , avc1.4d400b, 15fps, video only, 35.07MiB
278          webm       256x144    144p  131k , webm container, vp9, 15fps, video only, 85.60MiB
133          mp4        426x240    240p  135k , avc1.4d4015, 15fps, video only, 75.31MiB
242          webm       426x240    240p  139k , vp9, 15fps, video only, 183.88MiB
134          mp4        640x360    360p  257k , avc1.4d4016, 15fps, video only, 172.37MiB
243          webm       640x360    360p  283k , vp9, 15fps, video only, 279.81MiB
244          webm       854x480    480p  300k , vp9, 15fps, video only, 296.49MiB
247          webm       1280x720   720p  485k , vp9, 15fps, video only, 530.53MiB
135          mp4        854x480    480p  486k , avc1.4d401e, 15fps, video only, 282.29MiB
136          mp4        1280x720   720p  558k , avc1.4d401f, 15fps, video only, 385.51MiB
36           3gp        320x?      small , mp4v.20.3,  mp4a.40.2
17           3gp        176x144    small , mp4v.20.3,  mp4a.40.2@ 24k
43           webm       640x360    medium , vp8.0,  vorbis@128k
18           mp4        640x360    medium , avc1.42001E,  mp4a.40.2@ 96k
22           mp4        1280x720   hd720 , avc1.64001F,  mp4a.40.2@192k (best)
```
# Download with a specific format
```bash
youtube-dl -f FORMAT_CODE URL
```
# Rename the file removing spaces
```bash
mv "`ls -1t | head -1`" `ls -1t | head -1 | sed 's/\( \| - \)/_/g'`
```
