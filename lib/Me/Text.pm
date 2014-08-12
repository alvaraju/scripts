package Me::Text

use strict;
use warnings;

use Exporter qw(import);

our @EXPORT_OK = qw(rest);

sub rest{
    my ($x, $y) = @_;
    return $x-$y;
}

1;
