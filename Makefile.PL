use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME                => 'HTML::Element::Replacer',
    AUTHOR              => 'Terrence Brannon <tbone@cpan.org>',
    VERSION_FROM        => 'lib/HTML/Element/Replacer.pm',
    ABSTRACT_FROM       => 'lib/HTML/Element/Replacer.pm',
    ($ExtUtils::MakeMaker::VERSION >= 6.3002
      ? ('LICENSE'=> 'perl')
      : ()),
    PL_FILES            => {},
    PREREQ_PM => {
        'Test::More' => 0,
                  'HTML::Element::Library' => 0,
		  'Moose' => 0.72,
    },
    dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean               => { FILES => 'HTML-Element-Replacer-*' },
);
