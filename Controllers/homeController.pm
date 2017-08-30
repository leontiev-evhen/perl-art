package Controllers::homeController;

use strict;
use warnings;


sub showAction;

# sub new{
    # my $class = ref($_[0])||$_[0];
    # return bless{}, $class;
# }

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



sub showAction
{
 my ($self) = @_;

 return "Hello from controller";
}

1;
