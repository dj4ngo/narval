#!/bin/bash

DOCKER_IMAGE="dj4ngo/narval"


function usage() {
	cat <<EOF
$(basename $0) [start|update]
EOF

}


function narval_start() {
	mnt_point="${NARVAL_MNT_POINT:-$HOME/.narval}"

	echo "Running $DOCKER_IMAGE with $mnt_point as /mnt"

	# create dir if not present
	mkdir -p ${mnt_point}

	# Run container
	docker run --rm -it \
		-v $(readlink -f $mnt_point):/mnt \
		--hostname narval\
		$DOCKER_IMAGE /bin/bash
}

function narval_update() {
	docker pull dj4ngo/narval
}




#arg parsing
case "$1" in
	''|start)
		shift
		narval_start ${@}
	;;
	update)
		shift
		narval_update ${@}
	;;
	*)
		echo "Error while parsing arguments"
		usage
		exit 1
	;;
esac

