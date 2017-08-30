#user 11
package Models::DB;
use strict;
use warnings FATAL => 'all';

use Data::Dumper;
use DBI;

my $dbh;
my $dbName = 'user11';
my $dbHost = 'localhost';
my $dbUser = 'root';
my $dbPassword = 'root';


sub new
{
    my $class = ref($_[0])||$_[0];
    return bless {}, $class;
}

sub connect
{
    $dbh = DBI->connect("DBI:mysql:$dbName:$dbHost",$dbUser, $dbPassword);
    if ($dbh)
    {
        return $dbh;
    }
}

sub DESTROY
{
    $dbh->disconnect();
}



1;