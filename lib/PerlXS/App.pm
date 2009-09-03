use strict;
use warnings;

package PerlXS::App;
our $VERSION = '0.01';

use XUL::App::Schema;
use XUL::App schema {
	xulfile 'perlxs.xul' =>
		requires qw( sporx.js cnangel.css ),
		generated from 'PerlXS::View::Talk';

    xpifile 'perlxs.xpi' =>
        name is 'PerlXS',
        display_name is 'PerlXS',
        id is 'junliang.li@alibaba-inc.com', 
        version is '0.0.1',
        description is 'perl&xs talking for perl conference',
        targets {
            Firefox => ['2.0' => '3.*.*'],
            Mozilla => ['1.5' => '1.8'], 
        },
        creator is 'The Alibaba content team',
        developers are ['Cnangel'],
        contributors are ['Cnangel'],
        homepageURL is 'http://my.huhoo.net/study',
        iconURL is '',  # like 'chrome://perlxs/content/logo.png'
        updateURL is '', # This should not set for AMO extensions.
        aboutURL is '';
};

1;
