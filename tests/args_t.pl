#!/usr/bin/env perl -w
use strict;
use Test::More;
use Data::Dumper;
sub foo($) {
    my $list = shift;
    @$list = ();
}

sub bar($) {
    is($_[0][0], "a");
    # Clear this list
    @{$_[0]} = ();
}

my @bob = (1,2,3);
is(@bob, 3);
foo(\@bob);
is(@bob, 0);

@bob = ("a", "b", "c");
is($bob[0], "a");
bar(\@bob);
is(@bob, 0);
done_testing();

