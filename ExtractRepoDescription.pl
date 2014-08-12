#!/usr/bin/perl

use strict;
use warnings;
use Data::Dumper;

my $description=qx{grep "description" /var/www/access_dev/sdn/gitolite-admin/conf/repos.d/h3c.conf};

if( $description =~ /"(.+?)"/ )
{

    print "Description: $1\n";
}

print "description: $description\n";

