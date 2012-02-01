#!/bin/sh

##############################################
# created by @silenceroom @20120201
# This script used to cretaed the new email user and put the 
# users into proper email Group by pre-defined user group 
##############################################

createEmailAccount=/home/vpopmail/bin/vadduser
add2EmailList=/usr/local/bin/ezmlm/ezmlm-sub

domain=/home/vpopmail/domains/YourDomainName/

while read newUsers userGroup
do
	su vpopmail -c "$createEmailAccount -q NOQUOTA $newUsers@domain.anme $newUsers"
	while read mailList
	do
		su vpopmail -c "$add2EmailList $domain$mailList $newUsers@domain.name"
	done < ./inc/$userGroup
done < ./inc/newUsers_and_Group
