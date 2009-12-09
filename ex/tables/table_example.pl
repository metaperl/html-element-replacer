
use HTML::Element::Replacer;

my @beer = 
  (
   { brand => 'miller', age => 12 },
   { brand => 'coors' , age => 15 },
   { brand => 'coke'  , age => 22 }
  );

my @fruit =
  (
   { fruit => 'apple'  , color => 'red'    },
   { fruit => 'orange' , color => 'orange' },
   { fruit => 'banana' , color => 'yellow' }
  );



use table_example;
my $tree = table_example->new;


  {
   my $replacer = HTML::Element::Replacer->new(tree => $tree, look_down => [ seam_class => 'beer_row' ]);
 
   for my $data (@beer) {
       # defmap is documented here
       # http://search.cpan.org/~tbone/HTML-Element-Library-3.53/lib/HTML/Element/Library.pm#$elem-%3Edefmap($attr_name,_\%hashref,_$debug)
       $replacer->push_clone->defmap(kmap => $data); # clone and push onto @temp_list
   }

  }

  {
      use List::Cycle;
      my $row_style = List::Cycle->new( { values => [ qw/main alt/ ] } ) ;

      my $replacer = HTML::Element::Replacer->new(tree => $tree, look_down => [ seam_class => 'fruit_row' ]);

 
      for my $data (@fruit) {
	  # defmap is documented here
	  # http://search.cpan.org/~tbone/HTML-Element-Library-3.53/lib/HTML/Element/Library.pm#$elem-%3Edefmap($attr_name,_\%hashref,_$debug)
	  my $elem = $replacer->push_clone;
	  $elem->defmap(kmap => $data); # clone and push onto @temp_list
	  $elem->attr(row_style => $row_style->next);
      }

  }

warn $tree->as_HTML(undef, ' ');
