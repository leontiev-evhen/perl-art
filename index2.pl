#!/usr/bin/perl

use strict;
use warnings;
use Data::Dumper;

use lib qw(libs);
use Models::Users;

my $db = Models::Users->new();
#print $db->getUserById(1);
my %post = ('login' => 'test', 'password' => '123456', 'email' => 'test@test.com');
#print $db->createUser(%post);

my %post2 = ('login' => 'yevhen', 'password' => '123456');
#print $db->issetUser(%post2);

my %post3 = ('login' => 'yevhen2', 'password' => '1234567', 'email' => 'test@test.com');
my $userId = 1;
print $db->updateUser(%post3, $userId);