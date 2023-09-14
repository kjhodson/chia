

for DRIVE in a b c d e f g h i j k l m n
do
	echo -n "Doing /dev/sd${DRIVE}1: "
        sudo tune2fs -l /dev/sd${DRIVE}1 | grep 'Reserved block count'
done
