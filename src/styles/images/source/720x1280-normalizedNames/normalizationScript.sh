for file in `find . -name "*#*.png"`; do normalized=$(echo -n $file | sed s/#\.//); mv $file $normalized; done
for file in `find . -name "*&*"`; do normalized=$(echo -n $file|sed s/\&/_and_/); mv $file $normalized; done
for file in `find . -name '*.png'`; do nine-patch2sci $file; done
