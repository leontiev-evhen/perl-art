package Libs::Request;

use strict;
use warnings;
use Data::Dumper;

sub get;

sub new{
    my $class = ref($_[0])||$_[0];
    return bless{}, $class;
}

sub get{
    my ($self, $route, $default) = @_;
    my ($buffer, @pairs, $pair, $name, $value);
    my %get = ();
    # Read in text
    $ENV{'REQUEST_METHOD'} =~ tr/a-z/A-Z/;
    if ($ENV{'REQUEST_METHOD'} eq "GET")
    {
       $buffer = $ENV{'QUERY_STRING'};
    }
   
    
    # Split information into name/value pairs
    @pairs = split(/&/, $buffer);


     foreach $pair (@pairs)
     {
        ($name, $value) = split(/=/, $pair);
       
       $value =~ tr/+/ /;
       $value =~ s/%(..)/pack("C", hex($1))/eg;
  
        $get{$name} = $value;
     }
   
     
      return $get{$route} if exists $get{$route};
      
      return $default;
      
}

  

1;