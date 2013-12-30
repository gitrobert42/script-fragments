#!/bin/bash

# Logs message to stdout and to syslog.
#  
# log <priority> "<message>"
#     priority - one of: emerge alert crit error warn note info debug
#     message - log message. new lines and tabs likely removed by syslog.
#   
# Note: Set tag and facility to something meaningful

log() {
   # set when installing code in script
   local tag=""
   local facility=""
   
   # only include tag if set
   if [ ! -z $tag ]
   then
      tag="-t ${tag}"
   fi
   
   # only include facility if set
   if [ ! -z $facility ]
   then
      facility="${facility}."
   fi
   
   
   # parameters
   local priority=$1
   shift 1
   local msg="$@"
   local dtg=$(date +%H:%M:%S)
   
   # log to screen
   echo "${dtg} [${priority}]  ${msg}"

   # log to syslog
   logger -p ${facility}${priority} ${tag} "${msg}"
}
