#!/usr/bin/env perl -w
use TAP::Harness;
my $harness = TAP::Harness->new( \%args );
@tests = <*_t.pl>;
print @tests;
$harness->runtests(@tests);
