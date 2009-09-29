use strict;
use warnings;

package Label::App;
our $VERSION = '0.01';

use XUL::App::Schema;
use XUL::App schema {
	xulfile 'label.xul' =>
		generated from 'Label::View::Label';
	xulfile 'bso.xul' =>
		generated from 'Label::View::browserStatusOverlay';
    xpifile 'label.xpi' =>
        name is 'Label',
        display_name is 'Label',
        id is 'junliang.li@alibaba-inc.com', # FIXME: ensure id is unique.
        version is '0.0.1',
        description is '',
        targets {
            Firefox => ['2.0' => '3.*.*'],  # FIXME
            Mozilla => ['1.5' => '1.8'],  # FIXME
        },
        creator is 'The Label development team',
        developers are ['cnangel'],
        contributors are [],
        homepageURL is 'http://my.huhoo.net/study/', # FIXME
        iconURL is '',  # like 'chrome://label/content/logo.png'
        updateURL is '', # This should not set for AMO extensions.
        aboutURL is '';
};

1;
