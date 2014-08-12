#!/usr/bin/perl

use strict;
use warnings;
use Data::Dumper;

my $repo = "aether (sdn), essw (essw), flare (sdn), testware (hpn_ta), sentinel (sdn)";

my @repos = split(', ', $repo);


foreach my $r (@repos){


if($r =~ /(.+)? \((.+)?\)/g){
    print "Repo: ".$1.", Group: $2\n";
}
  }

#print join("\n",@repos);


