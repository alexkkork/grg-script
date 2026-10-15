# ================= BLOCKALL v2 (wildcard) =================
# paste everything, then run:  blockall
# undo with:                   unblockall

BLOCKALL_DIR="$HOME/.blockall"
BLOCKALL_LIST="$BLOCKALL_DIR/domains.txt"
BLOCKALL_EXTRA="$BLOCKALL_DIR/extra.txt"
BLOCKALL_INSTALLED="$BLOCKALL_DIR/installed-resolvers.txt"
BLOCKALL_PLIST="$HOME/Library/LaunchAgents/ai.blockall.dns.plist"
BLOCKALL_PORT=5354

_blockall_domains() {
  sed 's/#.*//' "$BLOCKALL_LIST" "$BLOCKALL_EXTRA" 2>/dev/null \
    | tr -s '[:space:]' '\n' | grep -v '^$' | sort -u
}

_blockall_write_list() {
  cat > "$BLOCKALL_LIST" <<'DOMAINS'
# every entry blocks the domain AND every subdomain of it.

# ---- google / youtube ----
google.com
google.co.uk
googleusercontent.com
googleapis.com
gstatic.com
ytimg.com
youtube.com
youtu.be
googlevideo.com
ggpht.com
gvt1.com
gvt2.com
gvt3.com
googleadservices.com
googlesyndication.com
doubleclick.net
google-analytics.com
googletagmanager.com
gmail.com
blogger.com
blogspot.com
android.com

# ---- meta ----
facebook.com
fb.com
fbcdn.net
messenger.com
instagram.com
cdninstagram.com
threads.net
threads.com
whatsapp.com
whatsapp.net

# ---- x / reddit ----
twitter.com
x.com
t.co
twimg.com
reddit.com
redd.it
redditstatic.com
redditmedia.com

# ---- tiktok / snap / pinterest / linkedin ----
tiktok.com
tiktokcdn.com
tiktokv.com
byteoversea.com
muscdn.com
snapchat.com
sc-cdn.net
pinterest.com
pinimg.com
linkedin.com
licdn.com
tumblr.com
bsky.app
bsky.network
mastodon.social

# ---- video / music ----
netflix.com
nflxvideo.net
nflximg.net
nflxso.net
nflxext.com
hulu.com
huluim.com
disneyplus.com
bamgrid.com
dssott.com
primevideo.com
max.com
hbomax.com
peacocktv.com
paramountplus.com
crunchyroll.com
vimeo.com
vimeocdn.com
dailymotion.com
twitch.tv
ttvnw.net
spotify.com
spotifycdn.com
scdn.co
soundcloud.com

# ---- messaging / calls ----
discord.com
discord.gg
discordapp.com
discordapp.net
telegram.org
t.me
telegram.me
signal.org
slack.com
slack-edge.com
zoom.us

# ---- gaming ----
steampowered.com
steamcommunity.com
steamstatic.com
steamcontent.com
roblox.com
rbxcdn.com
rbxstatic.com
epicgames.com
unrealengine.com
fortnite.com
ea.com
origin.com
blizzard.com
battle.net
playstation.com
playstation.net
sonyentertainmentnetwork.com
xbox.com
xboxlive.com
nintendo.com
nintendo.net
minecraft.net
mojang.com
riotgames.com
leagueoflegends.com
valorant.com
supercell.com
king.com
pokemon.com
gog.com
itch.io
rockstargames.com
ubisoft.com
ubisoftconnect.com
activision.com
callofduty.com

# ---- school / lms / homework ----
blackbaud.com
blackbaudhosting.com
myschoolapp.com
myschoolcdn.com
veracross.com
plusportals.com
rediker.com
renweb.com
factsmgt.com
infinitecampus.org
infinitecampus.com
instructure.com
canvaslms.com
instructuremedia.com
schoology.com
powerschool.com
powerschoollearning.com
haikulearning.com
blackboard.com
moodle.org
moodle.com
edsby.com
seesaw.me
classdojo.com
khanacademy.org
kastatic.org
kasandbox.org
ixl.com
duolingo.com
quizlet.com
quizizz.com
kahoot.it
kahoot.com
getkahoot.com
brainpop.com
newsela.com
edpuzzle.com
nearpod.com
desmos.com
wolframalpha.com
chegg.com
coursehero.com
turnitin.com
grammarly.com
naviance.com
collegeboard.org
commonapp.org
act.org
sparknotes.com
litcharts.com
jstor.org
overdrive.com
soraapp.com

# ---- ai ----
chatgpt.com
openai.com
oaistatic.com
claude.ai
anthropic.com
perplexity.ai
poe.com
huggingface.co
midjourney.com
runwayml.com
leonardo.ai
character.ai

# ---- dev / work ----
github.com
githubusercontent.com
githubassets.com
gitlab.com
bitbucket.org
stackoverflow.com
stackexchange.com
sstatic.net
npmjs.com
npmjs.org
nodejs.org
python.org
pypi.org
docker.com
vercel.com
netlify.com
netlify.app
notion.so
figma.com
trello.com
asana.com
monday.com
airtable.com
linear.app
atlassian.net
digitalocean.com
cloudflare.com

# ---- microsoft / apple / cloud ----
microsoft.com
live.com
outlook.com
office.com
onedrive.com
sharepoint.com
bing.com
msn.com
apple.com
icloud.com
dropbox.com
box.com

# ---- shopping / news / misc ----
amazon.com
media-amazon.com
images-amazon.com
amazonaws.com
ebay.com
etsy.com
walmart.com
target.com
wikipedia.org
wikimedia.org
espn.com
espncdn.com
cnn.com
nytimes.com
bbc.com
bbc.co.uk
theguardian.com
washingtonpost.com
wsj.com
ycombinator.com
medium.com
substack.com
weather.com
accuweather.com
imdb.com
rottentomatoes.com
goodreads.com
yelp.com
ticketmaster.com
stubhub.com
expedia.com
booking.com
airbnb.com
uber.com
doordash.com
grubhub.com
instacart.com

# ---- payments ----
paypal.com
venmo.com
stripe.com
coinbase.com
binance.com
DOMAINS
}

_blockall_dns_install() {
  cat > "$BLOCKALL_DIR/dnsblock.py" <<'PY'
#!/usr/bin/env python3
"""Answers 0.0.0.0 to every A query. Wildcard sinkhole."""
import socket, struct

HOST, PORT = "127.0.0.1", 5354

def skip_name(data, off):
    while True:
        n = data[off]
        off += 1
        if n == 0:
            return off
        off += n

def respond(data):
    if len(data) < 12:
        return None
    qd = struct.unpack("!H", data[4:6])[0]
    if qd < 1:
        return None
    end = skip_name(data, 12)
    if end + 4 > len(data):
        return None
    qtype = struct.unpack("!H", data[end:end + 2])[0]
    question = data[12:end + 4]
    answer, ancount = b"", 0
    if qtype == 1:                                   # A -> 0.0.0.0
        answer = (b"\xc0\x0c" + struct.pack("!HHIH", 1, 1, 30, 4)
                  + socket.inet_aton("0.0.0.0"))
        ancount = 1
    header = data[0:2] + struct.pack("!HHHHH", 0x8580, 1, ancount, 0, 0)
    return header + question + answer

def main():
    s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    s.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
    s.bind((HOST, PORT))
    while True:
        try:
            data, addr = s.recvfrom(4096)
        except OSError:
            continue
        out = respond(data)
        if out:
            s.sendto(out, addr)

main()
PY
  chmod +x "$BLOCKALL_DIR/dnsblock.py"

  mkdir -p "$(dirname "$BLOCKALL_PLIST")"
  cat > "$BLOCKALL_PLIST" <<PLIST
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
  <key>Label</key><string>ai.blockall.dns</string>
  <key>ProgramArguments</key>
  <array>
    <string>$(command -v python3)</string>
    <string>$BLOCKALL_DIR/dnsblock.py</string>
  </array>
  <key>RunAtLoad</key><true/>
  <key>KeepAlive</key><true/>
  <key>StandardOutPath</key><string>/tmp/blockall.log</string>
  <key>StandardErrorPath</key><string>/tmp/blockall.log</string>
</dict>
</plist>
PLIST

  launchctl unload "$BLOCKALL_PLIST" 2>/dev/null
  launchctl load "$BLOCKALL_PLIST" 2>/dev/null \
    || launchctl bootstrap "gui/$(id -u)" "$BLOCKALL_PLIST" 2>/dev/null
}

_blockall_dns_remove() {
  launchctl unload "$BLOCKALL_PLIST" 2>/dev/null
  launchctl bootout "gui/$(id -u)/ai.blockall.dns" 2>/dev/null
  rm -f "$BLOCKALL_PLIST"
}

_blockall_resolvers_install() {
  local t d
  t=$(mktemp -d) || return 1
  while IFS= read -r d; do
    printf 'nameserver 127.0.0.1\nport %s\n' "$BLOCKALL_PORT" > "$t/$d"
  done < <(_blockall_domains)
  sudo mkdir -p /etc/resolver
  sudo cp -f "$t"/* /etc/resolver/ || { rm -rf "$t"; return 1; }
  rm -rf "$t"
  _blockall_domains > "$BLOCKALL_INSTALLED"
}

_blockall_resolvers_remove() {
  [ -s "$BLOCKALL_INSTALLED" ] || return 0
  local files
  files=$(sed 's|^|/etc/resolver/|' "$BLOCKALL_INSTALLED" | tr '\n' ' ')
  sudo rm -f $files
  rm -f "$BLOCKALL_INSTALLED"
}

_blockall_hosts_install() {
  local tmp d
  tmp=$(mktemp) || return 1
  awk '/^# === BLOCKALL ===/{f=1;next} /^# === \/BLOCKALL ===/{f=0;next} !f' \
      /etc/hosts > "$tmp"
  {
    printf '\n# === BLOCKALL === %s\n' "$(date '+%Y-%m-%d %H:%M')"
    while IFS= read -r d; do
      printf '0.0.0.0 %s\n0.0.0.0 www.%s\n' "$d" "$d"
    done < <(_blockall_domains)
    printf '# === /BLOCKALL ===\n'
  } >> "$tmp"
  sudo tee /etc/hosts < "$tmp" >/dev/null
  rm -f "$tmp"
}

_blockall_hosts_remove() {
  local tmp
  tmp=$(mktemp) || return 1
  awk '/^# === BLOCKALL ===/{f=1;next} /^# === \/BLOCKALL ===/{f=0;next} !f' \
      /etc/hosts > "$tmp"
  sudo tee /etc/hosts < "$tmp" >/dev/null
  rm -f "$tmp"
}

blockall() {
  mkdir -p "$BLOCKALL_DIR" || return 1
  _blockall_write_list
  touch "$BLOCKALL_EXTRA"

  if command -v python3 >/dev/null 2>&1; then
    _blockall_dns_install
  else
    echo 'warning: no python3 found - subdomains will not be wildcarded'
  fi

  _blockall_resolvers_install
  _blockall_hosts_install

  sudo dscacheutil -flushcache 2>/dev/null
  sudo killall -HUP mDNSResponder 2>/dev/null

  printf '\n%d domains blocked, all subdomains included.\n' "$(_blockall_domains | wc -l | tr -d ' ')"
  printf 'fully quit your browser (not just close the tab).\n'
  printf 'verify with:  blockstatus\nundo with:    unblockall\n'
}

unblockall() {
  _blockall_resolvers_remove
  _blockall_dns_remove
  _blockall_hosts_remove
  unblockhard 2>/dev/null
  sudo dscacheutil -flushcache 2>/dev/null
  sudo killall -HUP mDNSResponder 2>/dev/null
  echo 'everything unblocked.'
}

blockadd() {
  [ -f "$BLOCKALL_LIST" ] || { echo 'run blockall once first'; return 1; }
  printf '%s\n' "$@" >> "$BLOCKALL_EXTRA"
  blockall
}

blockstatus() {
  if pgrep -f dnsblock.py >/dev/null 2>&1; then
    echo 'dns sinkhole : running'
  else
    echo 'dns sinkhole : NOT RUNNING'
  fi
  echo "patterns     : $(_blockall_domains | wc -l | tr -d ' ')"
  echo "resolvers    : $(ls /etc/resolver 2>/dev/null | wc -l | tr -d ' ')"
  echo
  echo 'lookups should all be 0.0.0.0:'
  local d
  for d in tiktok.com www.tiktok.com v123.tiktok.com cdn.deep.tiktok.com \
           google.com mail.google.com viewpoint.myschoolapp.com anything.roblox.com; do
    printf '  %-30s -> %s\n' "$d" \
      "$(dscacheutil -q host -a name "$d" 2>/dev/null | awk '/^ip_address:/{print $2; exit}')"
  done
}

blockrestart() {
  launchctl unload "$BLOCKALL_PLIST" 2>/dev/null
  launchctl load "$BLOCKALL_PLIST" 2>/dev/null
  echo 'dns sinkhole restarted.'
}

# optional: also drop packets to resolved IPs (defeats browser DoH)
blockhard() {
  [ -f "$BLOCKALL_LIST" ] || { echo 'run blockall first'; return 1; }
  local tmp; tmp=$(mktemp) || return 1
  {
    echo 'table <blockall> persist {'
    printf '%s\n' "$(_blockall_domains \
      | xargs -n 20 dig @1.1.1.1 +short +time=2 +tries=1 A 2>/dev/null \
      | grep -E '^([0-9]{1,3}\.){3}[0-9]{1,3}$' | sort -u | paste -sd, -)"
    echo '}'
    echo 'block drop out quick proto tcp from any to <blockall> port {