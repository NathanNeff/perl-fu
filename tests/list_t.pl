#!/usr/bin/env perl
use Test::More;
@list = (1,2);

is(1, $#list);
is(2, scalar(@list));

push(@list, "bob");
is(3, scalar(@list));

done_testing();
