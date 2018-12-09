**Vote to Kick - By FAXES**

**About**
Today I release a vote-to-kick system.This system allows players to be able to vote-to-kick. This can be helpful then there's no admins on the server at the time. The system is simple and has a config for basically everything. You can customize the needed votes before the player is kicked from the server, see further configs below! **Note: This scripts permissions are compatible with Fax-Core but are not required**

**In the Download**
  >__resource.lua
  server.lua
  client.lua
  config.lua
  License.md

<hr>

**Commands**
<small>Default Commands - These can be easily changed</small>
```
/votekick <ID> # Starts the vote-to-kick process
/voteyes # Votes yes on the active vote-to-kick
/voteno # Votes no on the active vote-to-kick
/cancelvote # Admin commands to force cancel a current vote
```

**Pictures:**
http://faxes.zone/imagebanks/l3d2o5.png
http://faxes.zone/JustAnotherStrangeDownload/8tauqo.mp4

<hr>

**Features List**
- Configurable amount of time before starting another vote
- Editable Commands
- Changeable amount of 'yes' votes needed before the player is kicked
- One vote per-player
- Compatible with Fax-Core
-  Configurable kick messages
- big config
- Displays message in chat

<hr>

[details="Default Configuration"]
```
faxCore = false -- If you have FAX-CORE and want to use its permissions set this to true.

minVoteAmt = 5 -- Amount of 'yes' votes needed to kick the player.

voteWaitTime = 10 -- Time in MINUTES that players must wait before using the voteCmd again (to prevent vote-to-kick spam).

playerKickMessages = true -- Do you want a kick message to display in chat when a player is kicked?

kickMessage = "You were vote kicked from the server" -- Message displayed to the player when they are vote kicked.

voteCmd = "votekick" -- Command that starts the vote to kick process.

CancelCmd = "cancelvote" -- Command to cancel the vote-to-kick event (Admin Use Only).

voteYesCmd = "voteyes" -- Command to vote yes on the kick.

voteNoCmd = "voteno" -- Command to vote no on the kick.

faxDebug = false -- Only set to true if asked by FAXES.
```
[/details]

<hr>

**Requirements**
None. This is a **STANDALONE!!!!!** script, but does work with Fax-Core (not required) NO ESX!

**Downloads:**
* [Download via Github](https://github.com/FAXES/Vote-to-Kick)
* <a class="attachment" href="http://faxes.zone/files/fax-vote2kick/1.0.rar">Or via Direct Download</a>

**Installation**
Place in your resources folder, just like [any other NORMAL resource](https://forum.fivem.net/t/how-to-install-a-fivem-resource-script/81013). Be sure to follow [this link](http://faxes.zone/docs/aceperms.html#vote2kick) for ACE Perms Docs.

If you have any issues or comments please put them below. :christmas_tree:

**Original Topic**
https://forum.fivem.net/t/release-vote-to-kick-vote-players-out-fax-vote2kick-1-0/191676
