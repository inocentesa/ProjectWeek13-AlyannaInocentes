#!/bin/bash

     echo "Memory Info:" > ~/backups/freemem/free_mem.txt
     free >> ~/backups/freemem/free_mem.txt

     echo -e "\nDisk Usage:" > ~/backups/diskuse/disk_usage.txt
     df -H | head -2 >> ~/backups/diskuse/disk_usage.txt

     lsof > ~/backups/openlist/open_list.txt

     df -h > ~/backups/freedisk/free_disk.txt
