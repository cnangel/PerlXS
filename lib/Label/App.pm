use strict;
use warnings;

package Label::App;
our $VERSION = '0.01';

use XUL::App::Schema;
use XUL::App schema {
    xpifile 'label.xpi' =>
        name is 'Label',
        display_name is 'Label',
        id is 'label@cnangel.Cnangel', # FIXME: ensure id is unique.
        version is '0.0.1',
        description is '',
        targets {
            Firefox => ['2.0' => '3.0.*'],  # FIXME
            Mozilla => ['1.5' => '1.8'],  # FIXME
        },
        creator is 'The Label development team',
        developers are ['cnangel'],
        contributors are [],
        homepageURL is 'http://label.cnangel.org', # FIXME
        iconURL is '',  # like 'chrome://label/content/logo.png'
        updateURL is '', # This should not set for AMO extensions.
        aboutURL is '';
};

1;
