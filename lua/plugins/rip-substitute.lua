return {
	-- 可视化搜索替换面板
	"chrisgrieser/nvim-rip-substitute",
	cmd = "RipSubstitute",
  opts = {
			popupWin = {
				title = " rip-substitute",
				border = (vim.o.winborder ~= "" and vim.o.winborder or "rounded"), -- `vim.o.winborder` on nvim 0.11, otherwise "rounded"
				matchCountHlGroup = "Keyword",
				noMatchHlGroup = "ErrorMsg",
				position = "bottom", ---@type "top"|"bottom"
				hideSearchReplaceLabels = false,
				hideKeymapHints = false,
				disableCompletions = true, -- such as from blink.cmp
			},
			prefill = {
				normal = "cursorWord", ---@type "cursorWord"|false
				visual = "selection", ---@type "selection"|false -- (not with ex-command, see README)
				startInReplaceLineIfPrefill = false,
				alsoPrefillReplaceLine = false,
			},
			keymaps = { -- normal mode (if not stated otherwise)
				abort = "q",
				confirmAndSubstituteInBuffer = "<CR>",
				insertModeConfirmAndSubstituteInBuffer = "<C-CR>",
				confirmAndSubstituteInCwd = "<S-CR>",
				prevSubstitutionInHistory = "<Up>",
				nextSubstitutionInHistory = "<Down>",
				toggleFixedStrings = "<C-f>", -- ripgrep's `--fixed-strings`
				toggleIgnoreCase = "<C-c>", -- ripgrep's `--ignore-case`
				openAtRegex101 = "R",
				showHelp = "?",
			},
			incrementalPreview = {
				matchHlGroup = "IncSearch",
				rangeBackdropBrightness = 50, ---@type number|false 0-100, false disables backdrop
			},
			regexOptions = {
				startWithFixedStrings = false,
				startWithIgnoreCase = false,
				pcre2 = true, -- enables lookarounds and backreferences, but slightly slower
				autoBraceSimpleCaptureGroups = true, -- disable if using named capture groups (see README)
			},
			editingBehavior = {
				-- typing `()` in the search line automatically adds `$n` to the replace line
				autoCaptureGroups = false,
			},
			history = {
				---@type string|false false to disable saving history, will only have sessional history
				path = vim.fn.stdpath("data") .. "/rip-substitute/history.json",
				maxSize = 30,
			},
			notification = {
				onSuccess = true,
				icon = "",
			},
			debug = false, -- extra notifications for debugging
	},
	keys = {
		{
			"<Leader>rr",
			function() require("rip-substitute").sub() end,
			mode = { "n", "x" },
			desc = " rip substitute",
		},
	},
}
