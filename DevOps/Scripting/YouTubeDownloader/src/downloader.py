import yt_dlp
import os


SRC_FILE = "./sources.txt"


def list_parser(src_file: str):
    """
    Format of sources.txt (default name)

    videoUrl catagory videoName
    """
    try:
        with open(src_file, 'r') as f:
            _srcs = [line.rstrip() for line in f.readlines()]
            srcs = []

            for _src in _srcs:
                if _src:
                    temp = _src.replace('  ','').split('|')
                    srcs.append(temp) 

            return srcs
    except FileNotFoundError as e:
        print(e)

    return []


def download(video_url: str, catagory: str, name: str):
    if os.path.exists(f"./Downloads/{catagory}/{name}.m4a"):
        print(f"{name} exists... skipping")
        return

    ydl_opts = {
        'format': 'm4a/bestaudio/best',
        # ℹ️ See help(yt_dlp.postprocessor) for a list of available Postprocessors and their arguments
        'postprocessors': [{  # Extract audio using ffmpeg
            'key': 'FFmpegExtractAudio',
            'preferredcodec': 'm4a',
        }],
        'outtmpl': f"./Downloads/{catagory}/{name}" + '.%(ext)s',
    }

    with yt_dlp.YoutubeDL(ydl_opts) as ydl: 
            ydl.download([video_url])


def main():
    sources = list_parser(SRC_FILE)

    # for url, catagory, name in sources:
    #     catagory = catagory.replace('\"', '')
    #     print(f"LINK {url}\nCATA {catagory}\nNAME {name}\n")

    for url, catagory, name in sources:
        download(url, catagory, name)


if __name__=='__main__':
    main()