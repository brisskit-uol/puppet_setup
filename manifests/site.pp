#Define some run stages
stage { 'first': before => Stage['second'] }
stage { 'second': before => Stage['main'] }

#Set up all the common ssh keys
import "keys"

#Process all the nodes
import 'nodes.pp'

