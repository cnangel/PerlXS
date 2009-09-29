use strict;
use warnings;

package Label::View::Label;
use base 'XUL::App::View::Base';
use Template::Declare::Tags
    #'HTML' => { namespace => 'html' },  # HTML namespace support
    'XUL';

template main => sub {
    show 'header';  # from XUL::App::View::Base
    window {
        attr {
            id => "label-label",
            xmlns => $::XUL_NAME_SPACE,
            #'xmlns:html' => $::HTML_NAME_SPACE,  # HTML namespace support
            title => 'Label',
            width => 800,
            height => 600,
            persist => 'sizemode screenX screenY width height',
        }
		label { "hello, world!" }
    }
};

1;
