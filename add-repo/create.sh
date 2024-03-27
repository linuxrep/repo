#!/bin/bash
dpkg-deb --build bookworm
mv bookworm.deb bookworm-$1.deb
mv bookworm-$1.deb bookworm/
dpkg-deb --build jammy
mv jammy.deb jammy-$1.deb
mv jammy-$1.deb jammy/
dpkg-deb --build focal
mv focal.deb focal-$1.deb
mv focal-$1.deb focal/
dpkg-deb --build mantic
mv mantic.deb mantic-$1.deb
mv mantic-$1.deb mantic/
dpkg-deb --build termux
mv termux.deb termux-$1.deb
mv termux-$1.deb termux/
cd ..
autogit --push
