

# TotalCAE CONFIDENTIAL
#
#
# 2016 TotalCAE
# All Rights Reserved.
#
# NOTICE: All information contained herein is, and remains
# the property of TotalCAE
#
# The intellectual and technical concepts contained
# herein are proprietary to TotalCAE
# and may be covered by U.S. and Foreign Patents,
# patents in process, and are protected by trade secret or copyright law.
# Dissemination of this information or reproduction of this material
# is strictly forbidden unless prior written permission is obtained
# from TotalCAE
#

export ADMIN_USER=$1
export ADMIN_PASSWORD=$2
export LICENSE_KEY=$3
export APPLICATION=$4
export NODEPREFIX=$5
export INSTANCE_COUNT=$6

printenv > /tmp/ENVIRONMENT

IP=`hostname -i`
localip=`hostname -i | cut --delimiter='.' -f -3`

mkdir -p /srv/ 
cd /srv
/bin/wget https://totalcaeapplications.blob.core.windows.net/applications/chef-repo.tar.gpg
echo ${LICENSE_KEY} |  gpg --batch --output chef-repo.tar --passphrase-fd O  --decrypt chef-repo.tar.gpg
tar xfv chef-repo.tar
cd chef-repo
./make-head.sh 

