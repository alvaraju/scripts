#!/usr/bin/perl -w

use strict;
use warnings;
use DBI;


# Database Connection Settings
my $user = "rogue";
my $passwd = "Fp;k}U,7~KW,1";
my $server = "gnosis.cri.hp.com";
my $dbh = DBI->connect("DBI:Sybase:server=$server", $user, $passwd, {PrintError => 0});
my $sth;

unless ($dbh) {
    die "Error: Failed to connect to server ($server).\nERROR MESSAGE: $DBI::errstr\n";
}else{
    print "\nSuccessful Connection.\n\n";
}


############### QUERIES ############
#          SELECT
print "Reading test:\n";
print "----------------------------------------------------\n";

my $sqlStatement = "SELECT * FROM [rogue].[dbo].[Chip]";
 print "$sqlStatement\n\n"; 
unless($sth = $dbh->prepare($sqlStatement)) {
    $dbh->disconnect;
    die "ERROR: Failed to prepare SQL statement.\nSQL: $sqlStatement\nERROR MESSAGE: $DBI::errstr";
}

unless ($sth->execute) {
    $dbh->disconnect;
    die "ERROR: Failed to execute query.\nSQL: $sqlStatement\nERROR MESSAGE: $DBI::errstr";
}


while ((my $id, my $fk, my $creator, my $chipName, my $chipVersion) = $sth->fetchrow ){
    print "$id  $fk  $creator  $chipName  $chipVersion\n";
}

 my $rows = $sth->rows;
print "\n Rows returned: $rows.\n";   

######################################
#                 INSERT
print "\nInsert test:\n";
$sqlStatement = "INSERT INTO [rogue].[dbo].[Chip] VALUES(3, 'alvaraju', 'Chipname', 'V4')";

 unless($sth = $dbh->prepare($sqlStatement)) {
    $dbh->disconnect;
    die "ERROR: Failed to prepare SQL statement.\nSQL: $sqlStatement\nERROR MESSAGE: $DBI::errstr";
}

unless ($sth->execute) {
    $dbh->disconnect;
    die "ERROR: Failed to execute query.\nSQL: $sqlStatement\nERROR MESSAGE: $DBI::errstr";
}
 print "$sqlStatement\n\n";
 print "Insert Successful!\n";

 #####################################
 #                  SELECT
 print "\nReading Updated table\n";
 $sqlStatement = "SELECT * FROM [rogue].[dbo].[Chip]";
 print "$sqlStatement\n\n";
unless($sth = $dbh->prepare($sqlStatement)) {
    $dbh->disconnect;
    die "ERROR: Failed to prepare SQL statement.\nSQL: $sqlStatement\nERROR MESSAGE: $DBI::errstr";
}

unless ($sth->execute) {
    $dbh->disconnect;
    die "ERROR: Failed to execute query.\nSQL: $sqlStatement\nERROR MESSAGE: $DBI::errstr";
}

while ((my $id, my $fk, my $creator, my $chipName, my $chipVersion) = $sth->fetchrow ){
    print "$id  $fk  $creator  $chipName  $chipVersion\n";
}

 $rows = $sth->rows;
print "\n Rows returned: $rows.\n";

###########################################
#                      DELETE
print "\nRemoving data from test.\n";
 $sqlStatement = "DELETE FROM [rogue].[dbo].[Chip] WHERE CreatorUsername = 'alvaraju'";

unless($sth = $dbh->prepare($sqlStatement)) {
    $dbh->disconnect;
    die "ERROR: Failed to prepare SQL statement.\nSQL: $sqlStatement\nERROR MESSAGE: $DBI::errstr";
}

unless ($sth->execute) {
    $dbh->disconnect;
    die "ERROR: Failed to execute query.\nSQL: $sqlStatement\nERROR MESSAGE: $DBI::errstr";
}             

########################################
#               CLOSE CONNECTION

$sth->finish;


$dbh->disconnect;

print "\nTest done! Bye!\n";
exit(0);
