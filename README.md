# 🍺 Dog - The Terminal's Last Call

*Welcome to Changi Airport's Terminal 3, Gate A14 - The Guinness Taproom*

---

## What's on Tap?

**Dog** is like that perfectly poured pint of Guinness you order at 2 AM during a layover in Singapore - it serves you exactly what you want, then makes it disappear forever.

Just like how a proper barkeep reads your file contents aloud before clearing your glass from the bar, `dog` displays file contents to stdout and then **permanently deletes** the file. Think of it as `cat` with a one-way ticket to deletion.

## House Rules

```bash
# Pour one out (literally)
./zig-out/bin/dog myfile.txt

# Read the menu first
./zig-out/bin/dog --help

# Clear multiple glasses at once
./zig-out/bin/dog file1.txt file2.txt file3.txt
```

## The Singapore Special

Unlike the traditional Unix `cat` command that leaves your files untouched like a responsible bartender, `dog` follows the airport bar philosophy: *"Drink up, time to board."* Your files get served and then vanish into the digital void, just like that fleeting moment between flights.

Perfect for:
- 🗑️ Reading log files before cleanup
- 📄 Processing temporary files that need immediate deletion
- 🧹 One-shot file operations where persistence is unwelcome

## Building Your Perfect Pint

```bash
# Enter the bar (devenv shell with zig enabled)
devenv shell

# Brew the binary
zig build

# The barkeep is ready at ./zig-out/bin/dog
```

## ⚠️ Last Call Warning

**This command permanently deletes files after reading them.** There's no undo, no recovery, no "actually, I changed my mind." Like spilled Guinness on a white shirt, what's done is done.

Use with the same caution you'd use when ordering your fourth pint before a long-haul flight.

---

*"Good software, like good Guinness, should settle properly before serving."*  
*- Some wise developer at Gate A14, probably*

**Safe travels, and may your files rest in peace. 🛫**
