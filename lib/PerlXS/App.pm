use strict;
use warnings;

package PerlXS::App;
our $VERSION = '0.01';

use XUL::App::Schema;
use XUL::App schema {
    xpifile 'perlxs.xpi' =>
        name is 'PerlXS',
        display_name is 'PerlXS',
        id is 'perlxs@cnangel.localhost.localdomain', # FIXME: ensure id is unique.
        version is '0.0.1',
        description is '',
        targets {
            Firefox => ['2.0' => '3.0.*'],  # FIXME
            Mozilla => ['1.5' => '1.8'],  # FIXME
        },
        creator is 'The PerlXS development team',
        developers are ['cnangel'],
        contributors are [],
        homepageURL is 'http://perlxs.cnangel.org', # FIXME
        iconURL is '',  # like 'chrome://perlxs/content/logo.png'
        updateURL is '', # This should not set for AMO extensions.
        aboutURL is '';
};

1;
