#user 11
package Models::Users;

use strict;
use warnings FATAL => 'all';

use Data::Dumper;

use Models::DB;

my $model;
my $db;
my $table = 'users';

sub new
{
    $model = Models::DB->new();
    $db = $model->connect();

    my $class = ref($_[0])||$_[0];
    return bless {}, $class;
}

sub getUserById
{
    my($self, $userId) = @_;
    my %hash = ();
    my $query = $db->prepare("SELECT id, login, email FROM $table WHERE id = ?");
    $query->bind_param(1, $userId);
    $query->execute();
    while (my $row = $query->fetchrow_hashref()) {
        $hash{'id'}= $row->{'id'};
        $hash{'login'}= $row->{'login'};
        $hash{'email'}= $row->{'email'};
    }

    $query->finish();
    return \%hash;
}

sub createUser
{
    my($self, %post) = @_;
    my $sql = "INSERT INTO $table (login, password, email) VALUES (?, ?, ?)";
    my $query = $db->prepare($sql);

    if ($query->execute($post{'login'}, $post{'password'}, $post{'email'}))
    {
        $query->finish();
        return "User inserted success";
    }
}

sub issetUser
{
    my($self, %post) = @_;
    my $query = $db->prepare("SELECT * FROM $table WHERE login = ? AND password = ?");

    $query->bind_param(1, $post{'login'});
    $query->bind_param(2, $post{'password'});
    $query->execute();

    if ($query->rows)
    {
        return 1;
    }
    else
    {
        return 0;
    }
}

sub updateUser
{
    my($self, %post, $userId) = @_;
    my $sql = "UPDATE $table SET login = ?, password = ?, email = ? WHERE id = ?";
    my $query = $db->prepare($sql);

    $query->bind_param(1, $post{'login'});
    $query->bind_param(2, $post{'password'});
    $query->bind_param(3, $post{'email'});
    $query->bind_param(4, $userId);

    if ($query->execute())
    {
        $query->finish();
        return "User updated success";
    }
}

1;