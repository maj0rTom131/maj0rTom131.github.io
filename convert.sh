#!/bin/bash

for d in /home/ubuntu/blog/img-orig/*;
do
	if [[ $(basename $d) = 2020* ]]
	then
		for file in $d/*;
		do
			if [ ${file: -4} == ".jpg" ] || [ ${file: -4} == ".png" ] || [ ${file: -4} == ".JPG" ] || [ ${file: -4} == ".PNG" ]
			then
				convert $file -resize 1024x ${d/img-orig/img}/$(basename $file)
				mogrify ${d/img-orig/img}/$(basename $file) -quality 30%
			fi
		done
	fi
done
