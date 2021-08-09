function hex_to_rgb(hex)
	local hex_in_decimal = tonumber(string.sub(hex, 2), 16);
	local mask = 255;
	return {
		r = bit.band(bit.rshift(hex_in_decimal, 16), 255);
		g = bit.band(bit.rshift(hex_in_decimal, 8), 255);
		b = bit.band(hex_in_decimal, 255);
	}
end

function rgba_to_rgb(color_hex, background, alpha)
	-- Docs
	-- https://ciechanow.ski/alpha-compositing/
	local c = hex_to_rgb(color_hex);
	local bg = hex_to_rgb(background);
	local new_r = (1 - alpha) * bg.r + alpha * c.r;
	local new_g = (1 - alpha) * bg.g + alpha * c.g;
	local new_b = (1 - alpha) * bg.b + alpha * c.b;
	return string.format("#%02X%02X%02X", new_r, new_g, new_b);
end

function make_schema() 
	-- core colors
	local orange = '#f79617';
	local yellow = '#ffc24';
	local green  = '#84CE5C';
	local cyan   = '#50EAFA';
	local blue   = '#32b4ff';
	local red    = '#ff3c41';
	local teal   = '#23D4AC';
	local purple = '#a884f3';

	-- gray shade based on #0e1a2a
	-- local gray0 = '#000111';
	-- local gray1 = '#0e1a2a';
	-- local gray2 = '#344050';
	-- local gray3 = '#5B6777';
	-- local gray4 = '#818D9D';
	-- local gray5 = '#A7B3C3';
	-- local gray6 = '#CDD9E9';
	-- local gray7 = '#F3FFFF';

	-- gray shade based on #171831
	local gray0   = '#000111';
	local gray1   = '#171831';
	local gray2   = '#31324B';
	local gray3   = '#4A4B64';
	local gray4   = '#64657E';
	local gray5   = '#7D7E97';
	local gray6   = '#9697B0';
	local gray7   = '#B0B1CA';
	local gray8   = '#CACBE4';
	local gray9   = '#E3E4FD';
	local gray10  = '#FCFDFF';

	--extended colors
	local red1    = '#ff3b30';
	local yellow1 = '#ffcc00';
	local blue1   = '#5ac8fa';

	return {
		none   = 'NONE';

		orange  = orange;
		yellow  = yellow;
		green   = green;
		cyan    = cyan;
		blue    = blue;
		red     = red;
		teal    = teal;
		purple  = purple;

		gray0   = gray0;
		gray1   = gray1;
		gray2   = gray2;
		gray3   = gray3;
		gray4   = gray4;
		gray5   = gray5;
		gray6   = gray6;
		gray7   = gray7;
		gray8   = gray8;
		gray9   = gray9;
		gray10  = gray10;

		diag  = {
			danger  = { fg = red1;    bg = rgba_to_rgb(red1, gray1, 0.16) };
			warning = { fg = yellow1; bg = rgba_to_rgb(yellow1, gray1, 0.16) };
			info    = { fg = blue1;   bg = rgba_to_rgb(blue1, gray1, 0.16) };
			hint    = { fg = blue1;   bg = rgba_to_rgb(blue1, gray1, 0.16) };
		};

		-- Functionality colors
		bg            = gray1;
		bg_popup      = gray7;
		bg_highlight  = rgba_to_rgb(blue, gray1, 0.3);
		bg_visual     = rgba_to_rgb(blue, gray1, 0.4);
		fg            = gray9;
		fg_disabled   = gray4;
		fg_invert     = gray0;
	}
end

local schema = make_schema();

function highlight(group, color)
	local style = color.style and 'gui=' .. color.style or 'gui=NONE'
	local fg = color.fg and 'guifg=' .. color.fg or 'guifg=NONE'
	local bg = color.bg and 'guibg=' .. color.bg or 'guibg=NONE'
	local sp = color.sp and 'guisp=' .. color.sp or ''
	vim.api.nvim_command('highlight ' .. group .. ' ' .. style .. ' ' .. fg .. ' ' .. bg .. ' '.. sp)
end

function load_syntax()
	local syntax = {
		Normal                = { fg=schema.fg,       bg=schema.none };
		Terminal              = { fg=schema.fg,       bg=schema.none };
		SignColumn            = { fg=schema.fg,       bg=schema.none };
		FoldColumn            = { fg=schema.fg_disabled,    bg=schema.none };
		VertSplit             = { fg=schema.gray4,    bg=schema.none };
		Folded                = { fg=schema.gray3,     bg=schema.bg_highlight };
		EndOfBuffer           = { fg=schema.bg,       bg=schema.none};
		IncSearch             = { fg=schema.fg_invert,      bg=schema.orange  };
		Search                = { bg=schema.bg_visual };
		Visual                = { bg=schema.bg_visual};
		VisualNOS             = { bg=schema.bg_visual};
		ColorColumn           = { fg=schema.none,     bg=schema.bg_highlight };
		Conceal               = { fg=schema.gray3,     bg=schema.none};
		Cursor                = { fg=schema.fg_invert,  bg=schema.gray7,        };
		lCursor               = { fg=schema.fg_invert,  bg=schema.gray7,        };
		CursorIM              = { fg=schema.fg_invert,  bg=schema.gray7,        };
		CursorColumn          = { fg=schema.none,     bg=schema.bg_highlight, style='underline' };
		CursorLine            = { fg=schema.none,     bg=schema.bg_highlight };
		LineNr                = { fg=schema.gray2,    bg=schema.none }; -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
		CursorLineNr          = { fg=schema.orange,     bg=schema.none, style="bold" }; -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line. This is for current line.
		DiffAdd               = { fg=schema.fg_invert,    bg=schema.green };
		DiffChange            = { fg=schema.fg_invert,    bg=schema.yellow };
		DiffDelete            = { fg=schema.fg_invert,    bg=schema.red };
		DiffText              = { fg=schema.fg_invert,    bg=schema.fg };
		Directory             = { fg=schema.fg_disabled,      bg=schema.none};
		ErrorMsg              = { fg=schema.red,      bg=schema.none,         style='bold'};
		WarningMsg            = { fg=schema.yellow,   bg=schema.none,         style='bold'};
		ModeMsg               = { fg=schema.fg,       bg=schema.none,         style='bold'};
		MatchParen            = { fg=schema.orange,   bg=schema.none,         style='bold'};
		NonText               = { fg=schema.fg_disabled,      bg=schema.none };
		Whitespace            = { fg=schema.fg_disabled,    bg=schema.none };
		SpecialKey            = { fg=schema.fg_disabled,      bg=schema.none };
		Pmenu                 = { fg=schema.fg_invert,       bg=schema.bg_popup };
		PmenuSel              = { fg=schema.fg_invert,       bg=schema.blue };-- Popup menu: selected item.
		PmenuSbar             = { bg=schema.bg_popup };-- Popup menu: scrollbar.
		PmenuThumb            = { bg=schema.teal };-- Popup menu: Thumb of the scrollbar.
		NormalFloat           = { fg=schema.fg_invert,bg=schema.bg_popup };
		WildMenu              = { fg=schema.fg,       bg=schema.green };
		Question              = { fg=schema.yellow,   bg=schema.none };
		TabLineFill           = { fg=schema.none,     bg=schema.none };
		TabLineSel            = { fg=schema.blue,     bg=schema.none };
		StatusLine            = { fg=schema.fg,       bg=schema.none };-- status line of current window
		StatusLineNC          = { fg=schema.fg,       bg=schema.none };-- status lines of not-current windows
		SpellBad              = { fg=schema.red,      bg=schema.none,         style='undercurl'};
		SpellCap              = { fg=schema.blue,     bg=schema.none,         style='undercurl'};
		SpellLocal            = { fg=schema.cyan,     bg=schema.none,         style='undercurl'};
		SpellRare             = { fg=schema.purple,   bg=schema.none,         style='undercurl'};
		QuickFixLine          = { fg=schema.purple,   bg=schema.none,         style='bold' };
		Debug                 = { fg=schema.orange,   bg=schema.none };

		Boolean               = { fg=schema.orange,   bg=schema.none,         style='italic' };
		Number                = { fg=schema.purple,   bg=schema.none };
		Float                 = { fg=schema.purple,   bg=schema.none };
		PreProc               = { fg=schema.purple,   bg=schema.none };
		PreCondit             = { fg=schema.purple,   bg=schema.none };
		Include               = { fg=schema.purple,   bg=schema.none };
		Define                = { fg=schema.purple,   bg=schema.none };
		Conditional           = { fg=schema.purple,   bg=schema.none };
		Repeat                = { fg=schema.purple,   bg=schema.none };
		Keyword               = { fg=schema.red,      bg=schema.none };
		Typedef               = { fg=schema.red,      bg=schema.none };
		Exception             = { fg=schema.red,      bg=schema.none };
		Statement             = { fg=schema.red,      bg=schema.none };
		Error                 = { fg=schema.red,      bg=schema.none };
		StorageClass          = { fg=schema.orange,   bg=schema.none };
		Tag                   = { fg=schema.orange,   bg=schema.none };
		Label                 = { fg=schema.orange,   bg=schema.none };
		Structure             = { fg=schema.orange,   bg=schema.none };
		Operator              = { fg=schema.purple,   bg=schema.none };
		Title                 = { fg=schema.orange,   bg=schema.none,         style='bold'};
		Special               = { fg=schema.yellow,   bg=schema.none };
		SpecialChar           = { fg=schema.yellow,   bg=schema.none };
		Type                  = { fg=schema.teal,     bg=schema.none };
		Function              = { fg=schema.yellow,   bg=schema.none };
		String                = { fg=schema.green,    bg=schema.none };
		Character             = { fg=schema.green,    bg=schema.none };
		Constant              = { fg=schema.cyan,     bg=schema.none };
		Macro                 = { fg=schema.cyan,     bg=schema.none };
		Identifier            = { fg=schema.blue,     bg=schema.none };

		Comment               = { fg=schema.fg_disabled,    bg=schema.none,         style='italic'};
		SpecialComment        = { fg=schema.gray3,          bg=schema.none};
		Todo                  = { fg=schema.cyan,           bg=schema.none};
		Delimiter             = { fg=schema.fg,       bg=schema.none};
		Ignore                = { fg=schema.gray3,    bg=schema.none};
		Underlined            = { fg=schema.none,     bg=schema.none,         style='underline'};

		GitGutterAdd          = { fg=schema.green,    bg=schema.none};
		GitGutterChange       = { fg=schema.blue,     bg=schema.none};
		GitGutterDelete       = { fg=schema.red,      bg=schema.none};
		GitGutterChangeDelete = { fg=schema.purple,   bg=schema.none};

		NvimTreeFolderName    = { fg=schema.blue,     bg=schema.none};
		NvimTreeRootFolder    = { fg=schema.red,      bg=schema.none,         style='bold' };
		NvimTreeOpenedFolderName = { fg=schema.blue,     bg=schema.none,      style='bold' };

		TSParameter           = { fg=schema.fg,       bg=schema.none };

		-- LspReferenceRead      = { fg=schema.none,     bg=schema.bg_highlight, style='bold' };
		-- LspReferenceWrite     = { fg=schema.none,     bg=schema.bg_highlight, style='bold' };
		-- LspReferenceText      = { fg=schema.none,     bg=schema.bg_highlight, style='bold' };
		--
		-- LspDiagnosticsSignError               = { fg=schema.diag.danger.fg,   style='bold'};
		-- LspDiagnosticsSignWarning             = { fg=schema.diag.warning.fg,  style='bold'};
		-- LspDiagnosticsSignInformation         = { fg=schema.diag.info.fg,     style='bold'};
		-- LspDiagnosticsSignHint                = { fg=schema.diag.hint.fg,     style='bold'};
		--
		-- LspDiagnosticsVirtualTextError        = { fg=schema.diag.danger.fg,   bg=schema.diag.danger.bg,   style='bold'};
		-- LspDiagnosticsVirtualTextWarning      = { fg=schema.diag.warning.fg,  bg=schema.diag.warning.bg,  style='bold' };
		-- LspDiagnosticsVirtualTextInfomation   = { fg=schema.diag.info.fg,     bg=schema.diag.info.bg,     style='bold'};
		-- LspDiagnosticsVirtualTextHint         = { fg=schema.diag.hint.fg,     bg=schema.diag.hint.bg,     style='bold'};
		--
		-- LspDiagnosticsUnderlineError          = { fg=schema.diag.danger.fg,   bg=schema.diag.danger.bg,   style='undercurl,bold'};
		-- LspDiagnosticsUnderlineWarning        = { fg=schema.diag.warning.fg,  bg=schema.diag.warning.bg,  style='undercurl,bold'};
		-- LspDiagnosticsUnderlineInformation    = { fg=schema.diag.info.fg,     bg=schema.diag.info.bg,     style='undercurl,bold'};
		-- LspDiagnosticsUnderlineHint           = { fg=schema.diag.hint.fg,     bg=schema.diag.hint.bg,     style='undercurl,bold'};
		--
		-- LspDiagnosticsDefaultError          = { fg=schema.diag.danger.fg, };
		-- LspDiagnosticsDefaultWarning        = { fg=schema.diag.warning.fg,};
		-- LspDiagnosticsDefaultInformation    = { fg=schema.diag.info.fg,   };
		-- LspDiagnosticsDefaultHint           = { fg=schema.diag.hint.fg,   };
		--
		-- markdownBold = {fg = schema.diag.warning.fg, style="bold,underline"} --this shit is for signature help, highlight current param
		CocErrorHighlight   = { fg=schema.diag.danger.fg,     bg=schema.diag.danger.bg,   style='undercurl,bold'};
		CocWarningHighlight = { fg=schema.diag.warning.fg,    bg=schema.diag.warning.bg,  style='undercurl,bold'};
		CocInfoHighlight    = { fg=schema.diag.info.fg,       bg=schema.diag.info.bg,     style='undercurl,bold'};
		CocHintHighlight    = { fg=schema.diag.hint.fg,       bg=schema.diag.hint.bg,     style='undercurl,bold'};

		CocHighlightRead      = { fg=schema.none,     bg=schema.bg_highlight, style='bold' };
		CocHighlightWrite     = { fg=schema.none,     bg=schema.bg_highlight, style='bold' };
		CocHighlightText      = { fg=schema.none,     bg=schema.bg_highlight, style='bold' };

		CocErrorSign      = { fg=schema.diag.danger.fg,   style='bold'};
		CocWarningSign    = { fg=schema.diag.warning.fg,  style='bold'};
		CocInfoSign       = { fg=schema.diag.info.fg,     style='bold'};
		CocHintSign       = { fg=schema.diag.hint.fg,     style='bold'};
	}
	return syntax
end

return {
	hex_to_rgb = hex_to_rgb;
	rgba_to_rgb = rgba_to_rgb;
	schema = schema;
}
