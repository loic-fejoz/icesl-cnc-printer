IceSL CNC Printer
=================

Description
-----------


A special "printer" configuration for [IceSL](http://www.loria.fr/~slefebvr/icesl/) that generates G-Code for [LinuxCNC](http://linuxcnc.org/) and possibly other CNC Mill or Router.

This is an experimental use of IceSL for CNC. Some good practices are not (yet) respected (eg machining direction), etc.

NB: This project is not affiliated to IceSL even if the main author know its authors in person.

Usage
-----

1. Select the printer in the left Menu
2. Check for proper configuration of brushes
3. Change your script as shown in next section
4. Disable plugin prime
5. Slice your model and save as .ngc files.
6. Inspect the result, with [CAMotics](http://camotics.org/) for instance (previously known as OpenSCAM).
7. Run on your CNC

Script
------

IceSL is meant for 3D printer, so before generating G-Code you must reverse its intents as shown in [test.lua](https://raw.githubusercontent.com/loic-fejoz/icesl-cnc-printer/master/test.lua):

    shape = cone(25, 1, 5)
    
    -- Viewing:
    --emit(shape)
    
    -- Machining:
    block_height = 5
    emit(
       difference(
          cube(50, 50, block_height),
          translate(0, 0, block_height) * mirror(v(0, 0, 1)) * shape
    ))


The general idea is that the top of the workpiece will be at level Z=0. So you must generate a cube for the workpiece and remove a mirror of the piece to be machined.
All jogs travel will be at positive Z level. All machining paths will be at negative Z level.

![test-snapshot.png](https://raw.githubusercontent.com/loic-fejoz/icesl-cnc-printer/master/test-snapshot.png)

Installation
------------

1. `cd <your IceSL path>/gcode`
2. `git clone git@github.com:loic-fejoz/icesl-cnc-printer.git cnc`
3. copy [settings_icesl-cnc-printer.xml](https://raw.githubusercontent.com/loic-fejoz/icesl-cnc-printer/master/settings_icesl-cnc-printer.xml) in
 - the bin folder if you run MS/Windows,
 - ~/.icesl/ directory if you run on Linux.

Troubleshooting
---------------

You may need to disable shield plugin to avoid segmentation fault.

Contribute
----------

If you would like to hack on icesl-cnc-printer, start by forking the repo on GitHub:

https://github.com/loic-fejoz/icesl-cnc-printer

The best way to contribute is probably one of the following:

* Clone the repo and follow [GitHub Workflow](https://guides.github.com/introduction/flow/index.html).
* Contact [Me <loic@fejoz.net>](mailto:loic@fejoz.net).
* Visit Me.

Authors
-------

This is a list of people who have contributed code or ideas to icesl-cnc-printer --
for copyright purposes or whatever.

* Loïc Fejoz <loic@fejoz.net> <https://github.com/loic-fejoz/>
