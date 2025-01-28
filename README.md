# bbb_debloat

Debloating script for Beagle Bone Black installations.

## Description

This script attempts to remove as much as possible of the "bloat" applications on the BeagleBone Black. It very likely will need tweaking as newer versions of the beaglebone debian images are release in future.

The reason this matters is that most Beaglebones only come with 4GB on eMMC, and the AM335x processor isn't the most powerful thing in the world. It would be nice if they released a new pin compatible board to replace the black which still focused on low power, headless use cases with the nice USB cable connection options that make the BB_Black more convenient than an RPI to develop on.

## Usage

<div align="center">

  **---- ---- ----**
  
  **The following steps assume you are using the default debian user with sudo privaleges.**
  
  **You should watch the script run in case it requires user input to continue at any point.**

  **---- ---- ----**
  
</div>

Run the following commands from the terminal on your BeagleBone black:

```bash
sudo apt update && wget https://github.com/robertjamessmith61/bbb_debloat/raw/refs/heads/master/bbb_debloat.sh && chmod 777 bbb_debloat.sh && sudo ./bbb_debloat.sh
```

Once the script finishes it is recommended to restart your beaglebone:

```bash
sudo reboot
```

## History

The latest changes I have made are to add the node red installer and bbai firmware packages to the purge list. I think the node red installer is most likely the big one that seems to have been missed so far. It's possible others might think node red is useful, but I primarily use bash, python and straight C for programming as required.
I've also fleshed out this README with more information.

This repo was forked from:

https://github.com/lapauwThomas/bbb_debloat

Who Added the bone101, cloud9 installer and nodejs packages to the purge list.
Notably, he also commented out the line to purge the avahi-daemon package. This package is pretty useful for name discovery stuff on LAN networks and worth keeping around for the convenience factor. I don't think it takes much memory anyway.

lapauwThomas forked it from the original author:

https://github.com/dl1com/bbb_debloat

Who wrote a blog article explaining why he did everything, etc. The original article is from 2014 which explains the updates which have been made to the scripts over time.
