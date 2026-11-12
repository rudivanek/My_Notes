# My Notes — Changes

Every version has a number and a date, for example **v39-2026-11-11**. It shows in tiny text at the top right of the sidebar and in `VERSION.txt`. Newest first.

---

## v41-2026-11-12
**My Notes on your phone.**
- **My Notes Mobile** (`m/`, online at https://rudivanek.github.io/My_Notes/m/) is a separate phone app with its own design. It works on the same vault through **Dropbox**. Start screen: recent notes and pins. It also has folders, search (`tag:`, `folder:`), tags, reading with links, backlinks, pictures and tappable checkboxes, editing with a small formatting bar, **+** for quick notes (to *Inbox*), importance, tags, pin and trash.
- **Share to My Notes** from any Android app (tweets, links, text) once it's installed.
- Works offline. Changes sync when online. If a note changed on both sides, nothing is lost: you get a *"(phone copy …)"* note. Old versions go to `.history` and deleted notes to `.trash`, the same as on the PC.
- Maps are shown and edited as text. Locked notes can be read but not edited.
- Desktop app: the only changes are that its offline helper (service worker) now leaves `m/` alone, and the version number. Nothing else changed.
- Manual: new section *My Notes on your phone*.

## v40-2026-11-11
- **The manual inside the app:** a **Manual** button at the bottom left of the sidebar (also in the demo banner and the command palette: *Open the manual*) opens the full manual with pictures, a "Jump to…" list of sections and working links. It loads from the app's own folder or from GitHub, so it works online and with the local starters.
- The demo's banner and welcome note point to **Open vault…** and the manual.

## v39-2026-11-11
**Ready for GitHub.**
- **Sample vault** (`Sample Vault/`): a small made-up vault (Northwind Bakery) with notes, a table, a map, daily notes and the whole manual, so you can try everything right away.
- **README**, **LICENSE** (MIT), **third-party notices**, this **CHANGES** file.
- **Start without installing:** the app also runs straight from GitHub Pages. Start scripts for Mac and Linux, next to the Windows `.bat`.
- Example questions and tips in the app no longer refer to personal projects.
- A vault opened for the first time starts on its pinned note ("Start here" in the sample vault).
- Command palette: **Claude key (add, change or remove)…** and **My AI buttons…**, since the ✨ button left the top bar in v36.
- Fix for GitHub Pages: the manual, the video and the sample vault on the same site are no longer replaced by the app.
- Manual: new screenshots, intro video, install steps for every system.

## v38-2026-11-11
**More from ✨ Suggestions.**
- **Ask about the whole note:** the Suggestions panel has an Ask row. Click a button or type any question. Put the answer at the top or end of the note (as an AI box), replace the note text (for rewrites and translations), save it as a new note that links back, or copy it.
- **My AI buttons:** one list of buttons for the whole note and for selected text: Explain, Summarize, Improve, Critique, Checklist, As email, → English / Español / Deutsch. Add your own, rename, reorder or remove them with **✎**. **☆ Save as button** keeps a question you typed. The list is shared with your other PCs.

## v37-2026-11-11
**Quicker start.**
- The app keeps a copy of your notes in Chrome's storage on this PC and shows it at once when you start. Then it checks the vault quietly ("Checking for changes…") and reads only the files that changed. Saving waits for that check, so nothing is written to the wrong place.
- Many files are now read at the same time, so a full read is faster too.

## v36-2026-11-11
**Note buttons moved to the note.**
- Buttons that only concern the open note (suggestions, pin, lock, history, send to table, print, PDF, delete) left the top bar. Next to the note title you now see the 3 you use most, plus **⋯** with all of them. The app learns which ones you use; **Customize buttons…** lets you always show some. Tables get the same row.

## v35-2026-11-11
- After sending a note to a table, you're told when the table's filter hides the new row. Clicking an "In tables" chip turns the filter off for now (Undo brings it back).

## v34-2026-11-11
- **Send to a table** fills the form for you: tags, title, web link. **✨ Fill in with AI** fills the other columns from the note, and you can let AI do that automatically per table.
- The Source column shows "📄 Note: name".

## v33-2026-11-11
- **"In tables" row** in a note: one chip per table row made from this note. Click it to jump to the row. **＋ table** sends the note to another table.

## v32-2026-11-11
- **Send a note to a table:** the note stays where it is; the table gets a new row that links to it (Source column), and the note links back to the row. You choose the table and fill in its columns; other properties can be copied as new columns. Tables that keep their row order get the new row at the end.
- A `[[link]]` in a table cell now shows as a clickable link.

## v31-2026-11-11
- **Organize page:** one big tree of all folders, tables and notes. Select several (click, Ctrl, Shift, tick boxes), drag & drop, move, cut & paste, rename, delete, new folder. Changes happen right away; **Undo** (Ctrl+Z) for moves and renames.

## v30-2026-11-11
- **Delete a column** from a table (in all its views), optionally removing its values from the notes.

## v29-2026-11-11
- **Select rows and delete them** in every table and Base: tick boxes at the left (Shift+click for a range), then **Delete** in the bar above.

## v28-2026-11-11
- AI boxes **show what was selected**: a marker line above whole lines, or highlighted words for part of a line.
- **Hide / show AI boxes** per note or for all notes (button in the formatting bar).

## v27-2026-11-11
- Fix: the "Ask about the selection" popup no longer runs off the bottom of the window.

## v26-2026-11-11
- **AI on selected text:** select text, click the ✨ that appears, then Explain, Summarize, Improve, Critique, translate, or ask anything. Put the answer in an **AI box** under the text, or replace the text.

## v25-2026-11-11
- Hovering a note in the sidebar also shows its folder.

## v24-2026-11-11
- **Ask your notes (Ctrl+J):** ask a question in any language. My Notes finds the best-fitting notes on your PC and Claude answers from them, with numbered sources you can click. Follow-up questions, folder scope, **Save as note**. Locked notes are never sent.

## v23-2026-11-11
- **Speed:** the vault is no longer re-read every time you click back into the window (only after 2+ minutes away); **Check for changes on disk** does it on demand. Faster sidebar, sorting and link checks.
- Folders in search results get the full right-click menu and can be dragged.

## v22-2026-11-11
- **Move a folder** into another folder (menu or drag & drop), with merge or new name on a clash. Links, tables, pins, icons and history follow.
- Thin dividers between the sidebar sections.

## v21-2026-11-11
- Tab right-click: pin / unpin, change icon.
- **Map card shapes:** rounded, pill, ellipse, circle, diamond, hexagon, sticky note.

## v20-2026-11-11
- **Search overhaul:** grouped results (recent, titles, folders, inside notes), forgiving matching (typos, initials), properties are searched too, narrowing words (`folder:` `tag:` `is:` `edited:` `opened:` `<property>:`), keyboard navigation, **saved searches**, better **Ctrl+O**.
- Resize the sidebar by dragging its edge; hide it with **Ctrl+\\**.

## v19-2026-11-11
- Tables: **Ctrl+Enter** for a new row; **filters** like Notion, saved per view; view tabs can be renamed, duplicated and deleted.

## v18-2026-11-11
- Tables: peek at a row's page text: 📄 marker, hover card, optional "Page text" column.

## v17-2026-11-11
- Tables keep rows in the order they were added. **Dropdown (several choices)** columns. Dropdown choices are saved reliably.

## v16-2026-11-11
- Tables: small **↗ open** column; spreadsheet keys (Tab, Shift+Tab, Enter, Shift+Enter, Esc, Space).

## v15-2026-11-11
- **Tables like Notion:** create a table, add columns (text, number, date, checkbox, dropdown, tags, link, URL), every row is a note. Edit cells in place, sort, rename, hide columns.

## v14-2026-11-11
- **Graph view** of how your notes link together: this note or the whole vault, filters, link notes by dragging one dot onto another.

## v13-2026-11-11
- **Command palette** (Ctrl+Shift+A or F1) with every action.

## v12-2026-11-11
- **Quick capture** from the taskbar / Start menu: New note, Today's note, Search notes.

## v9–v11-2026-11-11
- **Turn a note into a map (AI):** Claude makes a mind map of a note as a new map note, linked both ways.

## v8-2026-11-11
- Link files anywhere on the PC without copying them: paste paths from "Copy as path".

## v7-2026-11-10
- Drag files from File Explorer onto a note to link them. PDFs, images and other files in the vault open from their links.

## v6-2026-11-10
- Sidebar: hover dates, short dates, **Recent** section, sorting per folder, drag to reorder pins, date filter (Today / 7 days / 30 days).

## v5-2026-11-10
- Locked notes show a lock icon and close again when you leave them. Sidebar sort options.

## v4-2026-11-10
- **Locked notes** (AES-256, one password for the vault). **Version history** with "show changes" and restore.

## v3-2026-11-10
- **Trash** window: restore to the original folder, delete forever, empty trash.

## v2-2026-11-10
- Delete from the tab menu. Loading screen while the vault opens.

## v1-2026-11-10
- First numbered version: renamed to **My Notes**, no longer needs Obsidian (its settings live in `My Notes/settings.md`), map printing, open `.md` files from Windows, empty "Untitled" notes clean themselves up, the app reloads itself after an update.

## Before v1
Earlier unnumbered versions (called "Quiet Notes") built the basics: the editor with live Markdown, folders, tags, importance, properties, `[[links]]` and backlinks, Bases, maps, daily notes and templates, search, the web clipper, AI suggestions and Tidy up, printing and PDF, themes and fonts.
