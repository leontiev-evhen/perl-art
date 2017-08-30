package Controllers::defaultController;

use strict;
use warnings;
use vars qw(%hash $text2);

sub indexAction;


# Construct класса
sub TIESCALAR {
  my $class = shift;
  bless {}, $class;
}


# Reading the value of a bound variable
sub FETCH {
  my $self = shift;
  return $self;
}



sub indexAction
{
 my ($self) = @_;
 %hash = ('name'=>'name',
          '123'=>'321');

 require "html.pl";
 print "Content-type: text/html; charset=utf-8\n\n";
 return $text2;
 #return "Hello from default controller";
}

1;
