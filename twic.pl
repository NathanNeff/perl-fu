#!/bin/env perl
use strict;
use warnings;
use Env;
use File::Basename;
use File::Temp qw/tempfile/;

my $TWIC_DIR = "$ENV{HOME}/Dropbox/chess/ChessGames/twic/";
my $TWIC_ALL = "$TWIC_DIR/all_twic.pgn";

my @downloaded;
opendir(DIR,$TWIC_DIR) or die "Cannot open $TWIC_DIR\n";

my @files = readdir(DIR);
closedir(DIR);

foreach my $file(@files) {
    $file =~ /(\d+)\.pgn$/ && push @downloaded ,$1;
}

my $highest = (sort(@downloaded))[-1];

my $next = $highest + 1;

my $ret = 0;
while ($ret == 0) {
    $ret = system("wget http://www.theweekinchess.com/zips/twic${next}g.zip --directory-prefix $TWIC_DIR");
    if ($ret == 0) {
        system("unzip $TWIC_DIR/twic${next}g.zip -d $TWIC_DIR");
    }
    $next = $next + 1;
}

my $tempfile = (tempfile())[1];
system("rm $TWIC_ALL");
if (system("cat $TWIC_DIR/*pgn > $tempfile") == 0) {
    print "Moving $tempfile to $TWIC_ALL\n";
    system("mv $tempfile $TWIC_ALL");
}
