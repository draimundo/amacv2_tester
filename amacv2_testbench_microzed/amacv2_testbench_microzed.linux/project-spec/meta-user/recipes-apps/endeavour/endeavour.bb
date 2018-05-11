#
# Software for controlling the AXI Endeavour block.
#
#

SUMMARY = "Software for controlling the AXI Endeavour block."
SECTION = "PETALINUX/apps"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

SRC_URI = "git://github.com/kkrizka/endeavour_software.git;protocol=https"
SRCREV = "master"

S = "${WORKDIR}/git"

inherit cmake
