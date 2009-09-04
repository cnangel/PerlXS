use strict;
use warnings;

package PerlXS::View::Talk;
use base 'XUL::App::View::Base';
use Template::Declare::Tags
'HTML' => { namespace => 'html' },  # HTML namespace support
'XUL';

template main => sub {
	show 'header';  # from XUL::App::View::Base
		page {
			local $Template::Declare::Tags::SKIP_XML_ESCAPING = 1;
			attr {
				id => 'sporx',
				   title => _('PerlXS'),
				   xmlns => $::XUL_NAME_SPACE,
				   width => 800,
				   height => 800,
				   'xmlns:html' => $::HTML_NAME_SPACE,
				   orient => "vertical",
				   onkeypress => "Sporx.onKeyPress(event);",
			}
			show 'html';
			show 'deck';
			show 'broadcasterset';
			show 'commandset';
		}
};

template html => sub {
	html::textarea {
		attr {
			id => "builtinCode",
			   style => "visibility: collapse",
		}
	}
};

template deck => sub {
	deck {
		attr {
			id => 'deck',
			   flex => '1',
		}
		show 'vbox';
	}
};

template vbox => sub {
	vbox {
		attr {
			flex => '1',
				 onmousemove => "Sporx.onMouseMoveOnCanvas(event);",
		}
		toolbox {
			attr {
				id => "canvasToolbar",
			}
			show 'toolbar';
		}
		vbox {
			attr {
				flex => "1",
					 id => "canvas",
					 onclick => "Sporx.onPresentationClick(event);",
			}
			spacer { attr { flex => "1", } }
			hbox { 
				attr {
					flex => "1",
				}
				spacer { attr { flex => "1", } }
				vbox { attr { id => "content", } } 
				spacer { attr { flex => "1", } }
			}
			spacer { attr { flex => "1", } }
		}
	}
	vbox {
		attr {
			flex => "1",
				 id => "edit",
		}
		toolbox {
			toolbar {
				toolbarbutton {
					attr {
						label => "New Page",
							  oncommand => "Sporx.addPage()",
					}
				}
				spacer { attr { flex => "1", } }
				toolbarseparator { }
				toolbarbutton {
					attr {
						label => "View",
							  oncommand => "Sporx.toggleEditMode();",
					}
				}
				toolbarbutton {
					attr {
						label => "Reload",
							  oncommand => "Sporx.reload();",
					}
				}
			}
		}
		textbox {
			attr {
				id => "textField",
				   flex => "1",
				   multiline => "true",
				   oninput => "Sporx.onEdit()",
			}
		}
		hbox {
			attr {
				collapsed => "true",
			}
			iframe {
				attr {
					id => "dataLoader",
					   onload => "if (window.Sporx) Sporx.onDataLoad();",
				}
			}
		}
	}
};

template toolbar => sub {
	toolbar {
		toolbarbutton {
			attr {
				oncommand => "Sporx.home()",
						  label => "|&lt;&lt;",
						  observes => "canBack",
			}
		}
		toolbarbutton {
			attr {
				oncommand => "Sporx.back()",
						  label => "&lt;",
						  observes => "canBack",
			}
		}
		toolbarbutton {
			attr {
				oncommand => "Sporx.forward()",
						  label => "&gt;",
						  observes => "canForward",
			}
		}
		toolbarbutton {
			attr {
				oncommand => "Sporx.end()",
						  label => "&gt;&gt;|",
						  observes => "canForward",
			}
		}
		toolbarseparator { }
		show 'hbox';
		toolbarseparator { }
		vbox {
			attr {
				flex => "2",
			}
			spacer { attr { flex => "1", } }
			scrollbar {
				attr {
					id => "scroller",
					   align => "center",
					   orient => "horizontal",
					   oncommand => "Sporx.showPage(parseInt(event.target.getAttribute('curpos')));",
					   onclick => "Sporx.showPage(parseInt(event.target.getAttribute('curpos')));",
					   onmousedown => "Sporx.onScrollerDragStart();",
					   onmousemove => "Sporx.onScrollerDragMove();",
					   onmouseup => "Sporx.onScro    llerDragDrop();",
				}
			}
			spacer { attr { flex => "1", } }
		}
		toolbarseparator { }
		spacer { attr { flex => "1", } }
		toolbarseparator { }
		toolbarbutton {
			attr {
				id => "toggleEva",
				   label => "Eva",
				   type => "checkbox",
				   autoCheck => "false",
				   oncommand => "Sporx.toggleEvaMode();",
			}
		}
		toolbarseparator { }
		toolbarbutton {
			attr {
				label => "Edit",
					  oncommand => "Sporx.toggleEditMode();",
			}
		}
		toolbarbutton {
			attr {
				oncommand => "Sporx.reload();",
						  label => "Reload",
			}
		}
	}
};

template hbox => sub {
	hbox {
		attr {
			align => "center",
		}
		textbox {
			attr {
				id => "current_page",
				   size => "4",
				   oninput => "if (this.value) Sporx.showPage(parseInt(this.value)-1);",
			}
		}
		description {
			attr {
				value => "/",
			}
		}
		description {
			attr {
				id => "max_page",
			}
		}
	}
};

template broadcasterset => sub {
	broadcasterset {
		broadcaster { attr { id => 'canBack', } }
		broadcaster { attr { id => 'canForward', } }
	}
};

template commandset => sub {
	commandset {
		command {
			attr {
				id => "cmd_forward",
					oncommand => "if (Sporx.isPresentationMode) Sporx.forward();",
			}
		}
		command {
			attr {
				id => "cmd_back",
					oncommand => "if (Sporx.isPresentationMode) Sporx.back();",
			}
		}
		command {
			attr {
				id => "cmd_home",
					oncommand => "if (Sporx.isPresentationMode) Sporx.home();",
			}
		}
		command {
			attr {
				id => "cmd_end",
					oncommand => "if (Sporx.isPresentationMode) Sporx.end();",
			}
		}
	}
};

template keyset => sub {
	keyset {
		key {
			attr {
				key => " ",
					command => "cmd_forward",
			}
		}
		key {
			attr {
				keycode => "VK_ENTER",
					command => "cmd_forward"
			}
		}
		key {
			attr {
				keycode => "VK_RETURN",
					command => "cmd_forward"
			}
		}
		key {
			attr {
				keycode => "VK_PAGE_DOWN",
					command => "cmd_forward"
			}
		}
		key {
			attr {
				keycode => "VK_RIGHT",
					command => "cmd_forward"
			}
		}
		key {
			attr {
				keycode => "VK_DOWN",
					command => "cmd_forward"
			}
		}
		key {
			attr {
				keycode => "VK_UP",
					command => "cmd_back"
			}
		}
		key {
			attr {
				keycode => "VK_PAGE_UP",
					command => "cmd_back"
			}
		}
		key {
			attr {
				keycode => "VK_HOME",
					command => "cmd_home"
			}
		}
		key {
			attr {
				key => "n",
					modifiers => "accel",
					oncommand => "Sporx.addPage();",
			}
		}
		key {
			attr {
				key => "r",
					modifiers => "accel",
					oncommand => "window.location.reload();",
			}
		}
		key {
			attr {
				key => "e",
					modifiers => "accel",
					oncommand => "Sporx.toggleEditMode();",
			}
		}
		key {
			attr {
				key => "a",
					modifiers => "accel",
					oncommand => "Sporx.toggleEvaMode();",
			}
		}
	}
};

1;
