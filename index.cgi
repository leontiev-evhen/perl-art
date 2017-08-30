#!/usr/bin/perl

use strict;
use warnings;


use CGI::Carp qw(fatalsToBrowser);
use CGI qw(:cgi-lib :escapeHTML :unescapeHTML);
print "Content-Type: text/html; charset=utf-8";

use Data::Dumper;
use File::Basename qw(dirname);
use lib dirname(__FILE__).'/Views/';
use lib dirname(__FILE__).'/Libs/';
use lib dirname(__FILE__).'/Controllers/';
use CGI::Carp qw(fatalsToBrowser);

use Libs::Request;
use Controllers::homeController;
use Controllers::defaultController;

my $request = Libs::Request->new();
my $route_str = $request->get('route','default/index');

my @route = split m|/|, $route_str;
my $route_size = @route;
 if($route_size <2)
 {
	 @route = qw(default index);       #redirect from default/index
 }
my $controller = $route[0].'Controller';
my $action = $route[1].'Action';
my $content = "";

eval
{
    #dinamic binding
    tie $controller, "Controllers::$controller";

     #if method exists
     if($controller->can($action))
     {
	$content = $controller->$action();
     }
     else
     {

	  #print "Content-type: text/html; charset=utf-8\n\n";
	  #print "no action";
          warn $@;
     }

     #require Views.'/layout.pl';
 };
 if($@)
 {
    print "Content-type: text/html; charset=utf-8\n\n";
    print "error";

 }
else
{
    print "Content-type: text/html; charset=utf-8\n\n";
    print Dumper $content;
    #print Dumper $text;

}

#testing
    # if($controller == 'homeController')
# {
	# my $controller_obj = Controllers::homeController->new();
	# my $content = $controller_obj->$action();

	# print "Content-type: text/html; charset=utf-8\n\n";
	# print Dumper $content;
# }
