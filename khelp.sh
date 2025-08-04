#!/bin/bash

set -u

PKGNAME=Khelp
PKGVERSION=2.0

VERBOSE=0
DIRKHELP=$HOME/.khelp
DIRKHTAGS=$DIRKHELP/tags

source $DIRKHELP/scripts/kstat.sh
source $DIRKHELP/scripts/utils.sh

KHTAGNAME="" # Holds selected tag name (basename)

# Find tags that matching the $TAGNAME
khelp_lookp_tag_entries() {
	local TAGFILE
	local TAGFILES
	local TAGNAME=$1
	local TAGENTRY=$2
	local DIRTAGENTRY=$DIRKHTAGS/$TAGNAME

	#execit find $DIRTAGENTRY -maxdepth 1 -type f -name $TAGENTRY* | xargs -I {} bash -c 'kstat_barename {}'
	TAGFILES=($(find $DIRTAGENTRY -maxdepth 1 -type f -name $TAGENTRY* | xargs -I {} bash -c 'kstat_barename {}'))
	NTAGFILES=${#TAGFILES[@]}
	if [ "$NTAGFILES" -eq 0 ]; then
		echo_error "${FMTBBLUE}${PKGNAME}:${FMTBRED} '${FMTBYLW}${TAGENTRY}${FMTBRED}' is not exist in '${FMTBBLUE}${TAGNAME}${FMTBRED}' tag !!!"
		echo_info  "  You can add new tag entries at '${FMTBBLUE}${DIRTAGENTRY}${FMTBYLW}' and it will be displayed further."
		echo_info  "  The tag entries should be in plain text or .md file format."
		exit 1
	elif [ "$NTAGFILES" -gt 1 ]; then
		echo_error "Oops! multiple tag entries for '${FMTBYLW}${TAGENTRY}${FMTBRED}' in the '${FMTBBLUE}${TAGNAME}${FMTBRED}' tag."
		echo_info  "Try running 'khelp $TAGNAME' to open menu."
		exit 1
	else
		# Get file name that matches the tagname and basename
		TAGFILE=$(find $DIRTAGENTRY -maxdepth 1 -type f -name $TAGENTRY*)
	fi

	echo "$TAGFILE"
}

khelp_inline_tag_handler() {
	KHTAGNAME=$1
	local KHTAGFILE
	local DIRTAGENTRY=$DIRKHTAGS/$KHTAGNAME

	if [ $# -le 1 ]; then
		khelp_display_tag_entries $KHTAGNAME
	else
		exit_if_no_tag_entry $DIRTAGENTRY
		shift
		for TAGENTRY in $@; do
			KHTAGFILE=$(khelp_lookp_tag_entries $KHTAGNAME $TAGENTRY)

			if [ -s "$KHTAGFILE" ]; then
				khelp_display_tag_contents "$KHTAGFILE"
			fi
		done
	fi

	return $?
}

khelp_display_tag_contents() {
	local KHTAGFILE=$1
	local KHTAGFILE_BARENAME="$(kstat_barename $KHTAGFILE)"
	local KHTAGFILE_EXTENSION="$(kstat_extension $KHTAGFILE)"

	if [ "$KHTAGFILE_EXTENSION" == "md" ]; then
		if [[ $(which mdcat 2>/dev/null) ]]; then
			KHVIEW=mdcat
		else
			KHVIEW=cat
		fi
	else
		KHVIEW=cat
	fi

	echo_info "${FMTBBLUE}${PKGNAME}${FMTNC}: ${FMTBYLW}${KHTAGNAME}/${KHTAGFILE_BARENAME}${FMTNC}\n"
	$KHVIEW $KHTAGFILE

	return $?
}

khelp_display_tag_entries() {
	local DIRTAG=$DIRKHTAGS/$1
	local KHTAGITEMS    # Holds tag items in array format
	local KHTAGITEMLIST # Holds tag items in string format
	local KHTAGITEM     # Holds selected tag item (basename)

	exit_if_no_tags
	exit_if_no_tag_entry $DIRTAG
	exit_if_no_tag_items $DIRTAG

	KHTAGITEMLIST=$(ls "$DIRTAG")
	KHTAGITEMS=($KHTAGITEMLIST)

	# Display tag entries (sub menu)
	echo_info "${FMTBBLUE}${PKGNAME}:${FMTBYLW} Select any topic you wish to explore ..."
	khelp_display_menu_worker $KHTAGITEMLIST

	KHTAGITEM=${KHTAGITEMS[$?]}
	khelp_display_tag_contents "$DIRTAG/$KHTAGITEM"

	return $?
}

khelp_display_menu() {
	local KHTAGLIST # Holds tags in string format
	local KHTAGITEM # Holds tags in arry format

	exit_if_no_database
	exit_if_no_tags

	KHTAGLIST=$(ls "$DIRKHTAGS")
	KHTAGITEM=($KHTAGLIST)

	# Display tags (main menu)
	echo_info "${FMTBBLUE}${PKGNAME}:${FMTBYLW} Select any tag to continue ..."
	khelp_display_menu_worker $KHTAGLIST
	KHTAGNAME=${KHTAGITEM[$?]}

	# Display slected tag entries (sub menu)
	khelp_display_tag_entries $KHTAGNAME

	return $?
}

#------------------------------------------
# Main procedure
#------------------------------------------

khelp_main() {
	if [ $# -lt 1 ]; then
		khelp_display_menu $@
		exit $?
	fi

	khelp_parse_cmdline $@

	return $?
}

khelp_main $@

exit $?

# EOF
