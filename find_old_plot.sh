#/bin/bash
DEST="/plots/plots02/"

OLDPLOT=$(ls -t ${DEST}*.plot|tail -1)
NEWPLOT=$(ls -t ${DEST}*.plot|head -1)

ls -l ${OLDPLOT}
