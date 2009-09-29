use strict;
use warnings;

package Label::App;
our $VERSION = '0.01';

use XUL::App::Schema;
use XUL::App schema {
	xulfile 'label.xul' =>
		generated from 'Label::View::Label';
		includes qw(css/firebug.css css/highlighter.css);
	xulfile 'bso.xul' =>
		generated from 'Label::View::browserStatusOverlay';
		includes qw( js/a11y.js js/chrome.js js/commandLineInjected.js js/commandLine.js js/consoleInjected.js js/consoleInjector.js js/console.js js/css.js js/customizeShortcuts.js js/debuggerHalter.js js/debugger.js js/dom.js js/domplate.js js/editor.js js/editors.js js/editorToContextMenu.js js/errors.js js/firebug.js js/html.js js/infotip.js js/insideOutBox.js js/inspector.js js/jsonViewer.js js/layout.js js/lib.js js/net.js js/plugin.js js/profiler.js js/reps.js js/search.js js/shortcuts.js js/sourceCache.js js/spy.js js/tabCache.js js/tabContext.js js/tabWatcher.js js/traceConsole.js js/trace.js js/traceModule.js js/xpcom.js
				);
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
        iconURL is 'chrome://label/content/label.png',  # like 'chrome://label/content/logo.png'
        updateURL is '', # This should not set for AMO extensions.
        aboutURL is '';
};

1;
