#!/bin/bash

declare -A sound;

sound[Dog]="Bark";
sound[Lion]="Roar";
sound[Wolf]="Howl";

echo ${sound[@]};

echo "Size of dictionary : "${#sound[@]};

echo "Keys : "${!sound[@]};

for key in ${!sound[@]}
do
	echo "Sound of $key : ${sound[$key]}";
done
