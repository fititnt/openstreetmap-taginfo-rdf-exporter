#!/bin/bash
#===============================================================================
#
#          FILE:  setup.sh
#
#         USAGE:  ./scripts/setup.sh
#   DESCRIPTION:  ---
#
#       OPTIONS:  ---
#
#  REQUIREMENTS:  - curl
#                 - bzip2
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR:  Emerson Rocha <rocha[at]ieee.org>
#       COMPANY:  EticaAI
#       LICENSE:  Public Domain dedication
#                 SPDX-License-Identifier: Unlicense
#       VERSION:  v1.0
#       CREATED:  2022-11-15 10:10 UTC
#      REVISION:  ---
#===============================================================================
set -e

ROOTDIR="$(pwd)"
CACHEDIR="${CACHEDIR:-"$ROOTDIR/data/cache"}"

#### Fancy colors constants - - - - - - - - - - - - - - - - - - - - - - - - - -
tty_blue=$(tput setaf 4)
tty_green=$(tput setaf 2)
# tty_red=$(tput setaf 1)
tty_normal=$(tput sgr0)

## Example
# printf "\n\t%40s\n" "${tty_blue}${FUNCNAME[0]} STARTED ${tty_normal}"
# printf "\t%40s\n" "${tty_green}${FUNCNAME[0]} FINISHED OKAY ${tty_normal}"
# printf "\t%40s\n" "${tty_blue} INFO: [] ${tty_normal}"
# printf "\t%40s\n" "${tty_red} ERROR: [] ${tty_normal}"
#### Fancy colors constants - - - - - - - - - - - - - - - - - - - - - - - - - -

#### functions _________________________________________________________________

#######################################
# Download Taginfo (...)
# @see https://taginfo.openstreetmap.org/download
#
# Globals:
#   CACHEDIR
# Arguments:
#
# Outputs:
#
#######################################
data_download_taginfo_dump_db() {
  url_remote="https://taginfo.openstreetmap.org/download/taginfo-db.db.bz2"
  local_file="${CACHEDIR}/taginfo-db.db.bz2"
  local_db="${CACHEDIR}/taginfo-db.sqlite"
  printf "\n\t%40s\n" "${tty_blue}${FUNCNAME[0]} STARTED ${tty_normal}"

  if [ ! -f "$local_file" ]; then
    set -x
    curl --output "${local_file}" "${url_remote}"
    bzip2 --decompress "${local_file}" --stdout >"${local_db}"
    set +x
  else
    printf "\t%40s\n" "${tty_blue} INFO: [cached] ${tty_normal}"
  fi
  printf "\t%40s\n" "${tty_green}${FUNCNAME[0]} FINISHED OKAY ${tty_normal}"
}

#######################################
# Download Taginfo (...)
#
# Globals:
#   CACHEDIR
# Arguments:
#
# Outputs:
#
#######################################
data_download_taginfo_dump_master() {
  url_remote="https://taginfo.openstreetmap.org/download/taginfo-master.db.bz2"
  local_file="${CACHEDIR}/taginfo-master.db.bz2"
  local_db="${CACHEDIR}/taginfo-master.sqlite"
  printf "\n\t%40s\n" "${tty_blue}${FUNCNAME[0]} STARTED ${tty_normal}"

  if [ ! -f "$local_file" ]; then
    set -x
    curl --output "${local_file}" "${url_remote}"
    bzip2 --decompress "${local_file}" --stdout >"${local_db}"
    set +x
  else
    printf "\t%40s\n" "${tty_blue} INFO: [cached] ${tty_normal}"
  fi
  printf "\t%40s\n" "${tty_green}${FUNCNAME[0]} FINISHED OKAY ${tty_normal}"
}

#######################################
# Download Taginfo (...)
# @see https://taginfo.openstreetmap.org/download
#
# Globals:
#   CACHEDIR
# Arguments:
#
# Outputs:
#
#######################################
data_download_taginfo_dump_projects() {
  url_remote="https://taginfo.openstreetmap.org/download/taginfo-projects.db.bz2"
  local_file="${CACHEDIR}/taginfo-projects.db.bz2"
  local_db="${CACHEDIR}/taginfo-projects.sqlite"
  printf "\n\t%40s\n" "${tty_blue}${FUNCNAME[0]} STARTED ${tty_normal}"

  if [ ! -f "$local_file" ]; then
    set -x
    curl --output "${local_file}" "${url_remote}"
    bzip2 --decompress "${local_file}" --stdout >"${local_db}"
    set +x
  else
    printf "\t%40s\n" "${tty_blue} INFO: [cached] ${tty_normal}"
  fi
  printf "\t%40s\n" "${tty_green}${FUNCNAME[0]} FINISHED OKAY ${tty_normal}"
}

#######################################
# Download Taginfo (...)
# @see https://taginfo.openstreetmap.org/download
#
# Globals:
#   CACHEDIR
# Arguments:
#
# Outputs:
#
#######################################
data_download_taginfo_dump_wiki() {
  url_remote="https://taginfo.openstreetmap.org/download/taginfo-wiki.db.bz2"
  local_file="${CACHEDIR}/taginfo-wiki.db.bz2"
  local_db="${CACHEDIR}/taginfo-wiki.sqlite"
  printf "\n\t%40s\n" "${tty_blue}${FUNCNAME[0]} STARTED ${tty_normal}"

  if [ ! -f "$local_file" ]; then
    set -x
    curl --output "${local_file}" "${url_remote}"
    bzip2 --decompress "${local_file}" --stdout >"${local_db}"
    set +x
  else
    printf "\t%40s\n" "${tty_blue} INFO: [cached] ${tty_normal}"
  fi
  printf "\t%40s\n" "${tty_green}${FUNCNAME[0]} FINISHED OKAY ${tty_normal}"
}

#### main ______________________________________________________________________

# @TODO maybe use this https://stackoverflow.com/questions/2676041/is-it-possible-to-import-gzip-file-into-sqlite-could-i-skip-some-column-while

data_download_taginfo_dump_master
## data_download_taginfo_dump_db required >27 GB disk space
# data_download_taginfo_dump_db
data_download_taginfo_dump_projects
data_download_taginfo_dump_wiki
