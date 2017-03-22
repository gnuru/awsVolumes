#!/bin/bash
#

ageDate=`date --date="5 weeks ago" `
ageTicks=`date --date="5 weeks ago" +%s`


echo "Volumes older than $ageDate"
aws ec2 describe-volumes --filters Name=status,Values=available | \
				jq -r '.Volumes[] | "\(.VolumeId) \(.CreateTime)"' | while read volumeId createdDateStr; do
createdDate=`date --date="$createdDateStr"`
createdTicks=`date --date="$createdDateStr" +%s`
if [ $ageTicks -gt $createdTicks ]; then
	echo "TO Delete volid: ${volumeId}, ${createdDate} ( ${createdDateStr} )"
	aws ec2 delete-volume --volume-id $volumeId
#else
#	echo "current   volid: ${volumeId}, ${createdDate} ( ${createdDateStr} )"
fi

done
