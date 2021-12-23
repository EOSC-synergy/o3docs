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
# ${DOCSREPO_BRANCH} - branch of the git repository
# ${BUILDTARGET} - what type of documents to produce (e.g. html)
# ${HOSTUSER}  - user name or id at the host
# ${HOSTGROUP} - user group or id at the host

DocsSrc="/srv/docs_src"
SharedOutput="/srv/docs_out"
LogOutput="${SharedOutput}/build_docs_log.txt"
DateNow=$(date +%Y-%m-%dT%H:%M:%S)

# Check if environment settings exist, if not set defaults
[[ ${#DOCSREPO} -le 1 ]] && DOCSREPO="https://git.scc.kit.edu/synergy.o3as/o3docs"
[[ ${#DOCSREPO_BRANCH} -le 1 ]] && DOCSREPO_BRANCH="master"
[[ ${#BUILDTARGET} -le 1 ]] && BUILDTARGET="html"


if [ ! -d ${DocsSrc} ]; then
    echo "[INFO] ${DocsSrc} is NOT found, creating..."
    mkdir -p ${DocsSrc}
fi

if [ ! -d ${SharedOutput} ]; then
    echo "[INFO] ${SharedOutput} is NOT found, creating..."
    mkdir -p ${SharedOutput}
fi

# redirect everything below into LogOutput and Console (stdout + stderr)
exec > >(tee -a ${LogOutput}) 2>&1

echo ""
echo "[NEW BUILD] ${DateNow}"
echo "[INFO] Build Target: ${BUILDTARGET}"

if [ -d "${DocsSrc}/.git" ]; then
    echo "[INFO] .git in ${DocsSrc} is FOUND. Using LOCAL folder. Updating git submodules..."
    echo "[INFO] Git Branch to use: ${DOCSREPO_BRANCH}"
#    cd ${DocsSrc} && Git_Clone=$(git checkout ${DOCSREPO_BRANCH} && git submodule update --init --recursive)
    cd ${DocsSrc} && Git_Clone=$(git checkout ${DOCSREPO_BRANCH} && git submodule update --remote --merge)
else
    echo "[INFO] .git in ${DocsSrc} is NOT found. Cloning REMOTE ${DOCSREPO}..."
    echo "[INFO] Git Branch to use: ${DOCSREPO_BRANCH}"
    cd ${DocsSrc} && Git_Clone=$(git clone -b ${DOCSREPO_BRANCH} --recurse-submodules ${DOCSREPO} .)

fi

echo "[INFO] Installing dependencies from the requirements.txt"
pip3 install --no-cache -r requirements.txt

Make_Log=$(make ${BUILDTARGET})
status=$?
echo $Make_Log
if [ $status -eq 0 ]; then
    echo "[INFO] Change permissions of ${DocsSrc} to ${HOSTUSER}:${HOSTGROUP}"
    chown -R ${HOSTUSER}:${HOSTGROUP} ${DocsSrc}
    echo "[INFO] Copying _build directory to ${SharedOutput}"
    cp -u -R ${DocsSrc}/_build/* ${SharedOutput}
    echo "[INFO] Change permissions of ${SharedOutput} to ${HOSTUSER}:${HOSTGROUP}"
    chown -R ${HOSTUSER}:${HOSTGROUP} ${SharedOutput}
else
    echo "[ERROR] make ${BUILDTARGET} failed, exit status = ${status}"
fi
