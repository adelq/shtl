#
#
#           shtl - Nim app containers
#        (c) Copyright 2015 Adel Qalieh
#
#    See the file "LICENSE", included in this
#    distribution, for details about the copyright.
#

##   When the space shuttle's engines cut off, and you're finally in space, in
##   orbit, weightless... I remember unstrapping from my seat, floating over to
##   the window, and that's when I got my first view of Earth. Just a
##   spectacular view, and a chance to see our planet as a planet.
##   -- Sally Ride

import parseopt2
import docopt
import nuuid
import strutils

const doc = """
shtl

Usage:
  shtl run <image>...

Options:
  -h --help     Show this screen.
  -v --version  Show version.
"""

proc main() =
  var images: seq[string] = @[]
  let args = docopt(doc, version = "shtl 0.1.0")

  if args["run"]:
    echo("fly shuttle fly")
    echo("images: ", args["<image>"])

proc genUID(): string =
  return nuuid.generateUUID().toUpper()

when isMainModule:
  main()
