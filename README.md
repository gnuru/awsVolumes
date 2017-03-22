# awsVolumes

List and delete available AWS volumes.

## Requirements

* aws cli tools installed, and credentials configured.
* jq json parser

## Configuration.
Uses date format to specify age:
<code>
ageDate=`date --date="5 weeks ago" `
ageTicks=`date --date="5 weeks ago" +%s`
</code>

## Typical Output:

<code>
$ ./delOldVolumes.sh 
Volumes older than Wed Feb 15 05:17:45 UTC 2017
TO Delete volid: vol-00a8407XXYYzz001154, Thu Feb  9 06:12:00 UTC 2017 ( 2017-02-09T06:12:00.498Z )
</code>


