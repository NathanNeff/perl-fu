#!/usr/bin/env perl -w
use strict;
foreach my $i (1..10_000) {
    foreach my $j (1..10000) {
        print int(rand(256)), " ";
    }
    print "\n";
}
