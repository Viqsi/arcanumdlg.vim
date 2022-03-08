arcanumdlg.vim
--------------

This is a really barebones Vim filetype/syntax highlighting definition for the .dlg and .mes (character dialog and in-game messages and other things) files used by the game [Arcanum: Of Steamworks and Magick Obscura](https://en.wikipedia.org/wiki/Arcanum:_Of_Steamworks_and_Magick_Obscura). I put it together when working on revisions to same in Summer 2020. It is likely of little use to anyone who is not both 1) interested in mods or community fixes to this game and 2) a Vim user. (I might be the only one. But who knows?)

WARNING: I got this going only so far as I minimally needed and no more. By and large you'll sink or swim on your own; No Lifeguards Are On Duty.


### Some Fun Things Found And Done Along The Way, Now Offered To You

* Arcanum *only* understands Windows codepage encodings; trying to use anything else will get you garbage output in-game. The switch must be done on file load or else things go boom (attempting to use `:set fileencoding` introduces erroneous bytes if Vim has already loaded the file as UTF-8). I've attempted to enforce that in these plugins when opening a file, but it's a bit of a hack and strangeness may be expected.
* Pursuant to the above, you may safely assume that I only paid attention to the American English version of Arcanum. I'm told there are other versions in other languages; I know nothing of them and do not know if this package would cooperate with them. (I suspect, at a minimum, that the attempt to force cp1252 encoding - as described above - could be an issue.)
* The .mes/.dlg file format is used for many, many things other than dialog and/or game messages (it's basically numbered per-line groups of curlybrace-contained fields), and so I wasn't able to do much in the way of helpful type hinting or anything like that. I did what I could (particularly with .dlg, which *is* supposed to strictly be NPC chats), but there were limits to my knowledge and patience.
* As a result of the above, very little (read: pretty much no) consideration was given to matching up syntax highlighting semantics properly, outside of "comment" being used for comments and that's about it.
* The one seminifty thing I did add to .dlg files is a function specific to them, `ArcanumMaleFemaleLineCheck()`, which yanks the current line and then pulls up a scratch buffer showing a diff between the "male PC" and "female PC" dialog options. Editing in the scratch buffer does nothing and it doesn't update as you edit the actual file, so this is strictly a "look at the result as it was right now" function. But it was helpful to me all the same. Maybe it'll do that for you too.

Most of the work that this was all done in aid of ([a general review and revision of the grammar of the whole game](https://app.simplenote.com/p/wPX84X)) is not quite released yet, as Drog Black Tooth and I were still discussing additional revisions to be incorporated into the [UAP](https://terra-arcanum.com/drog/uap.html) when he (hopefully temporarily) walked away for a little while (no, I don't know why). If you're curious as to what I'd done already (and you know what a .diff file is and how to use it), pester me in the Arcanum community Discord or something and I may get back to you.

### Screenshots

The highlighting itself looks something like this:

![Arcanum dialog file, highlighted](https://cdn.discordapp.com/attachments/401101244405383169/722297478581583872/unknown.png)

Here's an example of the `ArcanumMaleFemaleLineCheck()` scratch buffers in action:

![A different Arcanum dialog file and scratch buffer showing male-versus-female](https://cdn.discordapp.com/attachments/401101244405383169/722453978050461696/unknown.png)
