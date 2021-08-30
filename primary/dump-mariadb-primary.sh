#!/bin/bash
mysqldump -h 127.0.0.1 -P 4001 -u root -p --master-data --all-databases --events --routines --gtid > dump.sql