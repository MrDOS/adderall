# Adderall

## Introduction

> Looks like I picked the wrong week to quit amphetamines.

The AirPort card in the 2013 MacBook Air is characterized by [high latency and
poor throughput][1]. This seems to be because the AirPort card is too aggressive
entering its power-saving mode. An effective (albeit blunt) solution is to
quickly and repetitively issue ICMP echo requests to (i.e., “ping”) another host
on the network. If these requests occur at least once every 0.2 seconds or so,
the Wi-Fi adapter doesn't enter sleep and is consistently responsive.

Adderall keeps AirPorts awake by ensuring a steady flow of ping requests while
a network connection is active.

[1]: http://www.engadget.com/2014/01/21/2013-macbook-air-wifi-problems-continue-to-plague-users/
     "2013 MacBook Air WiFi problems continue to plague users"

## Method

Adderall a simple loop. It checks to see if the Wi-Fi network interface (by
default, `en0`) is active. If it is, it starts pinging the default gateway every
0.2 seconds enough times to take around a minute. If it isn't, it goes to sleep
for a minute. Repeat ad nauseum.

## Usage

Being a shell script, no compilation is required. However, a makefile is
provided to simplify (un)installation. I suggest running `make install` or `make
uninstall` (as root) as required. If you'd rather perform the installation
manually, be my guest: consult the makefile for details.
