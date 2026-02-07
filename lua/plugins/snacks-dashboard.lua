return {
	'folke/snacks.nvim',
	priority = 1000,
	lazy = false,
	opts = {
		dashboard = {
			enabled = true,
			width = 60,
			row = nil,
			col = nil,
			autokeys = '1234567890abcdefghijklmnopqrstuvwxyz',
			preset = {
				header = [[
				|
				|
				|
				|
				|
				|
				_ ----- _
				.-~             ~-.       
				/                     \
				.-- -- -- |                       | -- -- --.
				.-~ / ~~ ~~ ~~ \        O   O        / ~~ ~~ ~~ \ ~-.
				.-~   /        _ - ~ ~-.             .-~ ~ - _        \   ~-.
				/      /~          /  ~ ----- ~  \          ~\      \
				/       /           /               \           \       \
				/           /                 \           \
				/           /                   \           \
				/           |                     |           \
				|                     |
				|                     |
				|                     |
				|                     |
				]],
			},
			sections = {
				{ section = 'header' },
				--{ section = 'keys', gap = 1, padding = 1 },
				--{ section = 'startup' },
			},
		},
	},
}

