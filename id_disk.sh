#!/bin/bash

for D in /dev/sd?
do
	echo -n "${D}1: "
	e2label ${D}1
done
