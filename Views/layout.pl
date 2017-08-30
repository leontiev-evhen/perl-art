use vars qw($text);

my $text = <<HTML;<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>MVC</title>
  </head>

  <body>

    <ul>
      <li><a href="/index.php">Home</a></li>
      <li><a href="/index.php?route=home/show">Books</a></li>
    </ul>
        
    <hr>
 
    <div>    
         $content
    </div>
    
    <hr>
    
    <footer>
        Copyright &copy; 2017
    </footer>
 
  </body>
</html>
HTML
