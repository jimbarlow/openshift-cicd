#!/bin/bash
#-x
# as student
export UID="8e59"
oc login https://masterdev-$GUID.generic.opentlc.com:8443
oc get projects
oc project dev
# open web console
oc new-app -f https://raw.githubusercontent.com/openshift-labs/devops-oab-labs/master/openshift/web-template.yaml

export UID="26df"
echo "oc login https://masterdev-$GUID.generic.opentlc.com:8443"
echo ""
read -p "Press any key to continue to run the command above " -n 1 -s
echo ""
echo "oc expose dc/app-a --name=ab-service --selector=abgroupmember=true --generator=service/v1"
echo ""
read -p "Press any key to continue to run the command above " -n 1 -s
oc expose dc/app-a --name=ab-service --selector=abgroupmember=true --generator=service/v1
echo ""
echo "oc expose service ab-service --name=ab-route  --hostname=abdeploy.cloudapps.na.openshift.opentlc.com"
echo ""
read -p "Press any key to continue to run the command above " -n 1 -s
""
oc expose service ab-service --name=ab-route  --hostname=abdeploy.cloudapps.na.openshift.opentlc.com
echo ""
read -p "Press any key to continue to run the command above " -n 1 -s
echo ""
echo "watch -n 1 'curl http://abdeploy.cloudapps.na.openshift.opentlc.com/ 2>&1 | grep -n "My Pod"'"
echo ""
read -p "Press any key to continue to run the command above " -n 1 -s
watch -n 1 'curl http://abdeploy.cloudapps.na.openshift.opentlc.com/ 2>&1 | grep -n "My Pod"'
