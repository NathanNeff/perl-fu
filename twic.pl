#!/bin/env perl
use strict;
use warnings;
cd ~/Documents/ChessGames/twic 
for i in {969..1000}; do
    wget http://www.theweekinchess.com/zips/twic${i}g.zip
done
