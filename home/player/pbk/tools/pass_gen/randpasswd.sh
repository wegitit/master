#!/bin/bash

# This is junk but I'm keepin' it

# pipe in a string 
# get back a looong password

# Alternatives:
#  grub-crypt --sha-512 (default) is a good RHEL 6 optioN


# REF: 
#  howtogeek.com/howto/30184/10-ways-to-generate-a-random-password-from-the-command-line/

# head: originally "head -c 92" to remove the trailing = at end of sha256sum output
#  sha512sum doesn't seem to have that trailing char.
#  It remains because it reduces the number of output lines from 4 without it to 3 with it

# REMOVE the eol chars if output to a file
sha512sum | base64 | head -c 178 ; echo


