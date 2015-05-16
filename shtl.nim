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
import tables

const doc = """
shtl

Usage:
  shtl run <image>...

Options:
  -h --help     Show this screen.
  -v --version  Show version.
"""

proc main() =
  let args = docopt(doc, version = "shtl 0.1.0")

  if args["run"]:
    echo("fly shuttle fly")
    echo("images: ", args["<image>"])

proc genUID(): string =
  return nuuid.generateUUID().toUpper()

type volumeMap = Table[string, string]

proc set(vm: var volumeMap, s:string) =
  let elems = s.split(':')
  if len(elems) != 2:
    raise newException(ValueError, "volume must be of form key:path")
  let key = elems[0]
  if vm.hasKey(key):
    raise newException(ValueError, "got multiple flags for volume " & key)
  vm[key] = elems[1]

when isMainModule:
  main()
