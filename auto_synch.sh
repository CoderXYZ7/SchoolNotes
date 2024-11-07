#!/bin/bash
cd /home/user1/Documents/SchoolNotes
git add .
git commit -m "Auto-sync: $(date)"
git push origin main
