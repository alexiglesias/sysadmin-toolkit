#!/usr/bin/env python3

# scans a directory and archives log files older than 30 days
# usage: python3 log_cleaner.py <logs_dir> <archive_dir>

import os
import sys
import shutil
from datetime import datetime, timedelta

logs_dir   = sys.argv[1] if len(sys.argv) > 1 else "/var/log/app-test"
archive_dir = sys.argv[2] if len(sys.argv) > 2 else "/var/log/app-test/archive"

cutoff = datetime.now() - timedelta(days=30)

def archive_old_logs(logs_dir, archive_dir):
    if not os.path.exists(logs_dir):
        print(f"directory not found: {logs_dir}")
        sys.exit(1)

    os.makedirs(archive_dir, exist_ok=True)

    archived = 0
    for filename in os.listdir(logs_dir):
        filepath = os.path.join(logs_dir, filename)

        # skip directories
        if os.path.isdir(filepath):
            continue

        file_mtime = datetime.fromtimestamp(os.path.getmtime(filepath))
        if file_mtime < cutoff:
            shutil.move(filepath, os.path.join(archive_dir, filename))
            print(f"archived: {filename}")
            archived += 1

    if archived == 0:
        print("no logs older than 30 days found")
    else:
        print(f"done. {archived} file(s) archived")

archive_old_logs(logs_dir, archive_dir)
