#!/usr/bin/env bash
#
# Copyright (c) 2018 - 2020 Karlsruhe Institute of Technology - Steinbuch Centre for Computing
# This code is distributed under the MIT License
# Please, see the LICENSE file
#
# @author: vykozlov
#
# Script to copy remote repository with submodules
# and generate documentation.
# Sphinx tool is expected to be installed via requirements.txt
#
# Expects two environment settings:
# ${DOCSREPO}    - git repository
# ${BUILDTARGET} - what type of documents to produce (e.g. html)
# ${HOSTUSER}  - user name or id at the host
# ${HOSTGROUP} - user group or id at the host
#

SrcDocs="/src/docs_src"
SharedOutput="/srv/docs_out"
LogOutput="${SharedOutput}/build_docs_log.txt"
DateNow=$(date +%Y-%m-%dT%H:%M:%S)

echo "" >> ${LogOutput}
echo "[NEW BUILD] ${DateNow}" >> ${LogOutput}
message="[INFO] Git Repository to use: ${DOCSREPO}"
echo $message && echo $message >> ${LogOutput}

message="[INFO] Build Target: ${BUILDTARGET}"
echo $message && echo $message >> ${LogOutput}

if [ -d ${SrcDocs} ]; then
    cd ${SrcDocs} && Git_Clone=$(git submodule update --init --recursive)
else
    Git_Clone=$(git clone --recurse-submodules ${DOCSREPO} ${SrcDocs})
    cd ${SrcDocs}
fi

echo "${Git_Clone}" >> ${LogOutput}

Pip3_Install=$(pip3 install --no-cache -r requirements.txt)
echo "${Pip3_Install}" >> ${LogOutput}

Make_Log=$(make ${BUILDTARGET})
status=$?
echo $Make_Log >> ${LogOutput}
if [ $status -eq 0 ]; then
    message="[INFO] Moving _build directory to ${SharedOutput}"
    echo $message && echo $message >> ${LogOutput}
    cp -u -R ${SrcDocs}/_build/* ${SharedOutput}
    message="[INFO] Change permissions of ${SharedOutput} to ${HOSTUSER}:${HOSTGROUP}"
    echo $message && echo $message >> ${LogOutput}
    chown -R ${HOSTUSER}:${HOSTUSER} ${SharedOutput}
else
    message="[ERROR] make ${BUILDTARGET} failed, exit status = ${status}"
    echo $message && echo $message  >> ${LogOutput}
fi
