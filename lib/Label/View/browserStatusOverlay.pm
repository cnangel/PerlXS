use strict;
use warnings;

package Label::View::browserStatusOverlay;
use base 'XUL::App::View::Base';
use Template::Declare::Tags
    #'HTML' => { namespace => 'html' },  # HTML namespace support
    'XUL';

template main => sub {
    show 'header';  # from XUL::App::View::Base
    overlay {
        attr {
            id => "label-browserstatusoverlay",
            xmlns => $::XUL_NAME_SPACE,
            #'xmlns:html' => $::HTML_NAME_SPACE,  # HTML namespace support

        }
        # Add your elements here...
		statusbar {
			attr {
				id => "status-bar",
			}
			statusbarpanel {
				id => "fbStatusBar",
			}
		}

    }
};

1;
