package My::Math;

use strict;
use warnings;

use Exporter qw(import);

our @EXPORT_OK = qw(add multiply);

sub add {
    use FindBin qw($RealBin);
    print "$RealBin    <--- Bin from Math.pm\n";
    

    use File::Basename qw(dirname);
    use Cwd qw(abs_path);
    print dirname(abs_path $0). "\n";
    my ($x, $y) = @_;
    return $x + $y;
}

sub multiply {
    my ($x, $y) = @_;
    return $x * $y;
}

1;
