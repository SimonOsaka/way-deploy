#!/bin/sh

pid_file='/apps/pid/api.pid'
if [ -f $pid_file ];
then
	echo '停止api'
	cat $pid_file | awk '{print $1}' | xargs kill -9
	rm -f $pid_file
fi