function exists() {
  command -v "$1" >/dev/null 2>&1
}

function ssh {
  if [ "$2" = "" ]; then
    conn="$1"
    sshhost=$(printf "%s" "${conn}" | cut -d '@' -f2)
    if rg -U -i "^#.*Features:.*mosh.*\nHost ${sshhost}" \
      "${HOME}/.ssh/config" >/dev/null; then
      printf "connecting with mosh ...\n"
      command mosh ${conn}
    else
      printf "connecting with ssh ...\n"
      command ssh ${conn}
    fi
  else
    printf "connecting with ssh ...\n"
    command ssh $@
  fi
}

function rip() {
  yt-dlp \
    -f bestaudio \
    --extract-audio \
    --audio-format mp3 \
    --audio-quality 0 \
    --yes-playlist \
    --add-metadata \
    "$1"
}

function video-to-gif() {
  fps="$3"
  if [[ "$3" == "" ]]; then
    fps="10"
  fi

  ffmpeg \
    -i "$1" \
    -filter_complex \
    $(printf "%s%s%s%s" \
      "[0:v]setpts=0.5*PTS,fps=" \
      $fps \
      ",scale=800:-1:flags=lanczos,split[s0][s1];" \
      "[s0]palettegen[p];[s1][p]paletteuse") \
    -filter:a 'atempo=1,atempo=1' \
    -loop 0 \
    "$2"
}
