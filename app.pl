#!/usr/bin/perl

use strict;
use warnings;

use FindBin qw($Bin);
use lib "$Bin/lib";
use My::Math qw(add);


print add(19, 23);

