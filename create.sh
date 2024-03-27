#!/bin/bash

if [ "$1" = "--termux" ]; then
	if [ "$2" = "--install" ]; then
		pkg install termux-apt-repo
	elif [ "$2" = "--make" ]; then
		termux-apt-repo pkg-termux repo-termux
	else
		echo "Wrong Operant"
	fi
elif [ "$1" = "--debian" ]; then
	if [ "$2" = "--install" ]; then
		sudo apt install reprepro -y
	elif [ "$2" = "--make" ]; then
		reprepro -Vb ./repo-debian includedeb mantic ./pkg-debian/*.deb
		reprepro -Vb ./repo-debian includedeb jammy ./pkg-debian/*.deb
		reprepro -Vb ./repo-debian includedeb bookworm ./pkg-debian/*.deb
		reprepro -Vb ./repo-debian includedeb focal ./pkg-debian/*.deb
	elif [ "$2" = "--update" ]; then
		reprepro -Vb ./repo-debian update mantic
		reprepro -Vb ./repo-debian update jammy
		reprepro -Vb ./repo-debian update bookworm
		reprepro -Vb ./repo-debian update focal
	else
		echo "Wrong Operant"
	fi
else
	echo "Wrong Operant"
fi
