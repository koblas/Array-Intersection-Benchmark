#!/usr/bin/perl

use strict;
use Time::HiRes;

my (@x, @y);

my $junk = <>;

while (<>) {
    my($a, $b) = split;

    push(@x, $a);
    push(@y, $b);
}

my $t0 = [Time::HiRes::gettimeofday];
my @xy = isect(\@x, \@y);
my $t1 = [Time::HiRes::gettimeofday];


print "Set   | n = ",($#x+1)," : ",($#xy+1)," intersects found in ",Time::HiRes::tv_interval($t0, $t1)," seconds\n";

sub isect(@@) {
    my %e = map {$_=>1} @{$_[0]};
    return grep { $e{$_} } @{$_[1]};
} 
