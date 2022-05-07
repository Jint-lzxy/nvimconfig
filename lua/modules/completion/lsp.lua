require("modules.completion.formatting")

vim.cmd([[packadd nvim-lsp-installer]])
vim.cmd([[packadd lsp_signature.nvim]])
vim.cmd([[packadd lspsaga.nvim]])
vim.cmd([[packadd cmp-nvim-lsp]])
vim.cmd([[packadd aerial.nvim]])
vim.cmd([[packadd vim-illuminate]])

local nvim_lsp = require("lspconfig")
local saga = require("lspsaga")
local lsp_installer = require("nvim-lsp-installer")

-- Override diagnostics symbol

saga.init_lsp_saga({
	error_sign = "",
	warn_sign = "",
	hint_sign = "",
	infor_sign = "",
})

lsp_installer.settings({
	ui = {
		icons = {
			server_installed = "✓",
			server_pending = "➜",
			server_uninstalled = "✗",
		},
	},
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

-- Override default format setting

vim.lsp.handlers["textDocument/formatting"] = function(err, result, ctx)
	if err ~= nil or result == nil then
		return
	end
	if
		vim.api.nvim_buf_get_var(ctx.bufnr, "init_changedtick") == vim.api.nvim_buf_get_var(ctx.bufnr, "changedtick")
	then
		local view = vim.fn.winsaveview()
		vim.lsp.util.apply_text_edits(result, ctx.bufnr, "utf-16")
		vim.fn.winrestview(view)
		if ctx.bufnr == vim.api.nvim_get_current_buf() then
			vim.b.saving_format = true
			vim.cmd([[update]])
			vim.b.saving_format = false
		end
	end
end

local function custom_attach(client)
	require("lsp_signature").on_attach({
		bind = true,
		use_lspsaga = false,
		floating_window = true,
		fix_pos = true,
		hint_enable = true,
		hi_parameter = "Search",
		handler_opts = { "double" },
	})
	require("aerial").on_attach(client)
	require("illuminate").on_attach(client)

	if client.resolved_capabilities.document_formatting then
		vim.cmd([[augroup Format]])
		vim.cmd([[autocmd! * <buffer>]])
		vim.cmd([[autocmd BufWritePost <buffer> lua require'modules.completion.formatting'.format()]])
		vim.cmd([[augroup END]])
	end
end

local function switch_source_header_splitcmd(bufnr, splitcmd)
	bufnr = nvim_lsp.util.validate_bufnr(bufnr)
	local clangd_client = nvim_lsp.util.get_active_client_by_name(bufnr, "clangd")
	local params = { uri = vim.uri_from_bufnr(bufnr) }
	if clangd_client then
		clangd_client.request("textDocument/switchSourceHeader", params, function(err, result)
			if err then
				error(tostring(err))
			end
			if not result then
				print("Corresponding file can’t be determined")
				return
			end
			vim.api.nvim_command(splitcmd .. " " .. vim.uri_to_fname(result))
		end)
	else
		print("method textDocument/switchSourceHeader is not supported by any servers active on the current buffer")
	end
end

-- Override server settings here

local enhance_server_opts = {
	["sumneko_lua"] = function(opts)
		opts.settings = {
			Lua = {
				runtime = { version = { "LuaJIT" } },
				diagnostics = {
					globals = {
						"vim",
						-- 天慾录 全局 exp from vscode
						"lstg",
						"firefly",
						"obj",
						"_allow_practice",
						"_allow_sc_practice",
						"Scene",
						"DoFile",
						"_luastg_version",
						"_luastg_min_support",
						"KEY",
						"socket",
						"meterstart",
						"default_setting",
						"wx",
						"cjson",
						"setting",
						"sp",
						"Players",
						"BoxCheck",
						"jstg",
						"last",
						"name",
						"diff",
						"player",
						"loadConfigure",
						"bullet",
						"img_class",
						"b",
						"GetAttr",
						"Extramode",
						"_debug_stage_name",
						"_boss_class_name",
						"_boss_class_sc_index",
						"menu_network",
						"menu_player_select1",
						"menu_player_select2",
						"menu_playercount",
						"tar1",
						"dmg",
						"rend_R",
						"rend_R1",
						"x",
						"y",
						"z",
						"x0",
						"y0",
						"x1",
						"y1",
						"x2",
						"y2",
						"x3",
						"y3",
						"x4",
						"y4",
						"bamboo_background",
						"bamboo2_background",
						"cube_background",
						"galaxy_background",
						"gensokyosora_background",
						"gzz_stage04bg_background",
						"gzz_stage03bg",
						"gzz_stg6bg_background",
						"gzz_stg6bg",
						"hongmoguan",
						"hongmoguanB_background",
						"icepool_background",
						"stagebackground",
						"lake_background",
						"le03_5_background",
						"magic_forest_fast_background",
						"magic_forest_background",
						"river_background",
						"stage3bg",
						"stage4bg",
						"pre_background",
						"stairs_background",
						"starlight_background",
						"rnd",
						"temple2_background",
						"temple3_background",
						"tkz_stage3_bg",
						"woods_background",
						"woods_leaf",
						"world_background",
						"_mod_version",
						"alluseT",
						"int",
						"abs",
						"max",
						"min",
						"sqrt",
						"mod",
						"sign",
						"hypot",
						"combinNum",
						"ran",
						"all_class",
						"class_name",
						"object",
						"lfs",
						"new_scoredata_table",
						"scoredata_mt_newindex",
						"scoredata_mt_index",
						"make_scoredata_table",
						"scoredata",
						"stage",
						"plus",
						"current_module_name",
						"current_module",
						"current_dir",
						"modules",
						"save_setting",
						"setting_keys_default",
						"stage_launcher",
						"cur_setting",
						"menu_title",
						"menu_name",
						"menu_mod",
						"menu_key",
						"menu_other",
						"menu_plugin",
						"name_set_menu",
						"key_setting_menu",
						"other_setting_menu",
						"simple_menu_mod",
						"_plugin_manager_menu",
						"align",
						"start_game",
						"background",
						"camera_setter",
						"_str",
						"_spellcard_background",
						"spellcard_background",
						"temple_background",
						"particle_img",
						"arrow_big",
						"arrow_mid",
						"gun_bullet",
						"gun_bullet_void",
						"butterfly",
						"square",
						"ball_mid",
						"ball_mid_b",
						"ball_mid_c",
						"ball_mid_d",
						"money",
						"mildew",
						"ellipse",
						"star_small",
						"star_big",
						"star_big_b",
						"ball_huge",
						"ball_huge_dark",
						"ball_light",
						"ball_light_dark",
						"ball_big",
						"heart",
						"ball_small",
						"grain_a",
						"grain_b",
						"grain_c",
						"kite",
						"knife",
						"knife_b",
						"arrow_small",
						"water_drop",
						"water_drop_dark",
						"music",
						"silence",
						"straight",
						"straight_indes",
						"straight_495",
						"bullet_killer",
						"bullet_deleter",
						"bullet_killer_SP",
						"bullet_deleter2",
						"bomb_bullet_killer",
						"archimedes",
						"clockwise",
						"anticlockwise",
						"shooter",
						"bent_laser_shooter",
						"laser_shooter",
						"class",
						"define_class",
						"new",
						"_editor_class",
						"_editor_tasks",
						"_sc_table",
						"_infinite",
						"_object",
						"bubble3",
						"_kill",
						"_del",
						"_set_a",
						"_set_g",
						"_forbid_v",
						"_can_be_master",
						"_connect",
						"_set_rel_pos",
						"_kill_servants",
						"_del_servants",
						"_straight",
						"_create_bullet_group",
						"_bullet_shooter",
						"_clear_bullet",
						"bullet_cleaner",
						"_play_music",
						"_pause_music",
						"_resume_music",
						"_stop_music",
						"_drop_item",
						"_init_item",
						"smear",
						"archiexpand",
						"archirotate",
						"_dialog_can_skip",
						"dialog_displayer",
						"lastdialogpic",
						"lastsentence",
						"spell_card_ef",
						"boss_cast_ef_unit",
						"boss_cast_ef_unit_new",
						"boss_cast_ef_in",
						"boss_cast_ef_out",
						"boss_cast_ef",
						"boss_cast_cherry",
						"boss_cast_cherry_unit",
						"boss_cast_darkball",
						"boss_cast_darkball_unit",
						"boss_death_ef",
						"boss_death_ef_unit",
						"kill_timer",
						"kill_timer2",
						"hinter_bonus",
						"test_ex",
						"boss_ui",
						"_boss",
						"enemybase",
						"enemy_meta_newindex",
						"enemy",
						"_enemy_aura_tb",
						"_death_ef_tb",
						"enemy_death_ef",
						"replayWriter",
						"replayReader",
						"gamecontinueflag",
						"moveoverflag",
						"item",
						"item_power",
						"item_power_large",
						"item_power_full",
						"item_extend",
						"item_chip",
						"item_bombchip",
						"item_bomb",
						"item_faith",
						"item_faith_minor",
						"item_point",
						"laser_bent",
						"laser_bent_meta_newindex",
						"laser_bent_renderFunc",
						"laser_bent_renderFuncDeath",
						"laser_bent_death_ef",
						"laser_texture_num",
						"laser_data",
						"laser",
						"laser_death_ef",
						"misc",
						"hinter",
						"bubble",
						"bubble2",
						"float_text",
						"float_text2",
						"shaker_maker",
						"tasker",
						"shutter",
						"mask_fader",
						"renderstar",
						"rendercircle",
						"music_list",
						"player_lib",
						"r",
						"grazer",
						"death_weapon",
						"player_bullet_straight",
						"player_bullet_hide",
						"player_bullet_trail",
						"player_spell_mask",
						"player_death_ef",
						"deatheff",
						"player_list",
						"stage_init",
						"menu_items",
						"menu_player_select",
						"menu",
						"sc_pr_menu",
						"simple_menu",
						"simple_image",
						"replay_saver",
						"replay_loader",
						"stage_menu",
						"_title_flag",
						"practice",
						"last_menu",
						"ui",
						"_lstg_ui",
						"reimudld_player",
						"reimudld_bullet_red",
						"reimudld_bullet_purple",
						"reimudld_bullet_ef",
						"reimu_needle_ef",
						"r_b_bg_radiation",
						"r_b_bg_ring",
						"r_b_bg",
						"reimu_player_A",
						"reimu_bullet_red",
						"reimu_bullet_purple_A",
						"reimu_bullet_orange",
						"reimu_sp_ef1",
						"reimu_bullet_orange_ef",
						"reimu_bullet_blue",
						"reimu_sp_ef",
						"reimu_bullet_ef",
						"reimu_sp_ef2",
						"reimu_player_B",
						"reimuB_SP",
						"reimu_bullet_purple",
						"reimu_orange",
						"reimuhzc_player",
						"reimu_dabi_B",
						"reimu_dabi_B1",
						"effect",
						"reimu_dabi",
						"reimuhzc_bullet_red",
						"reimuhzc_bullet_blue",
						"reimu_player",
						"reimu_bullet_red_ef",
						"reimu_bullet_blue_ef",
						"reimu_bullet_orange_ef2",
						"reimu_kekkai",
						"sakuya_player",
						"sakuya_knife",
						"sakuya_knife_ef",
						"sakuya_blood_ef",
						"sakuya_fake_bullet",
						"sakuya_reverse",
						"sakuya_bombdamage",
						"marisa_player",
						"marisa_bullet",
						"marisa_missile",
						"marisa_missile_ef",
						"marisa_bullet_ef",
						"marisa_laser_hit",
						"marisa_sp_ef",
						"marisa_spark",
						"marisa_spark_wave",
						"sanae_player",
						"sanae_sp_ef",
						"sanae_trail",
						"sanae_frog",
						"sanae_frog_ef",
						"sanae_trail_ef",
						"sanae_bullet",
						"sanae_bullet_ef",
						"cheat",
						"sin",
						"cos",
						"tan",
						"color",
						"atan2",
						"self",
						"qingLan2",
						"draw_road",
						"trail",
						"road_disp",
						"road_sign",
						"master",
						"enemy_kill_counter",
						"i",
						"config",
						"args",
						"_luastg_main_mod",
						"default_network",
						"ImageList",
						"_editor_cards",
						"_editor_funcs",
						"difficulty",
						"Collision_Checker",
						"is_debug",
						"stage1_background",
						"stage2_background",
						"stage3_background",
						"stage4_background",
						"spell_open_circle_eff",
						"spell_open_1",
						"spell_open_2",
						"spell_open_3",
						"spell_open_4",
						"egg",
						"qingLan1",
						"flower",
						"basic_item_class",
						"item_night_minor",
						"thspf_marisa_player",
						"marisa_main",
						"marisa_main_ef",
						"yuyuko_main",
						"yuyuko_main_ef",
						"laser_dmg",
						"marisa_constellation_coord",
						"marisa_constellation_name",
						"marisa_AstralStasis",
						"marisa_bomb_a",
						"marisa_bomb_b",
						"yuyuko_bomb_a",
						"yuyuko_bomb_b",
						"yuyuko_sakura",
						"thspf_mokou_player",
						"mokou_main",
						"mokou_main_ef",
						"mokou_bomb_shoot",
						"mokou_bomb_ready",
						"mokou_spread",
						"keine_bullet",
						"keine_bullet_ef",
						"keine_bomb_c",
						"keine_bomb_b",
						"keine_bomb_a",
						"keine_bomb_dmg",
						"mokou_bomb_a",
						"mokou_bomb_b",
						"mokou_bomb_c",
						"mokou_bomb_d",
						"mokou_bomb_c1",
						"mokou_bomb_dmg",
						"thspf_reimu_player",
						"reimu_bullet",
						"reimu_trail",
						"yukari_laser_dmg",
						"reimu_bomb_a",
						"reimu_bomb_d",
						"reimu_bomb_a1",
						"reimu_bomb_a2",
						"reimu_bomb_b",
						"reimu_bomb_c",
						"yukari_dmg",
						"yukari_bomb_aA",
						"yukari_bomb_a",
						"yukari_bomb_b",
						"yukari_bomb_aEND",
						"yukari_bomb_cEND",
						"jstgobj",
						"frame",
						"stg_target",
						"loadNetwork",
						"network",
						"saveNetwork",
						"saveConfigure",
						"input",
						"__args__",
						"ripairs",
						"rpairs",
						"fipairs",
						"fripairs",
						"player_class",
						"menu_difficulty_select_pr",
						"menu_practice",
						"dye_straighly_fly_to_enemy",
						"_author",
						"noDropKill",
						"dye_fly_to_enemy",
						"dye_particle",
						"display_hpbar_on_the_bottom",
						"laserbullet",
						"orginal",
						"da",
						"kite_b",
						"u",
						"drop",
						"st",
						"a",
						"dx",
						"dy",
						"v2",
						"way",
						"ia0",
						"rai",
						"sa",
						"co",
						"hscale",
						"vscale",
						"lasttask",
						"_tmp_sc",
						"s2_wave1_enemy1",
						"s2_wave1_enemy2",
						"s2_enemy_1",
						"s2_road_disp1",
						"s2_enemy_2",
						"s2_road_disp3",
						"s2_road_disp2",
						"s2_wave2_enemy1",
						"s2_enemy_3",
						"s2_wave3_enemy1",
						"s2_enemy_4",
						"s2_enemy_5",
						"s2_wave4_enemy1",
						"s2_wave5_enemy1",
						"s2_ghostfires",
						"s2_enemy_6",
						"spawn_firefly",
						"spawn_ghost_firefly",
						"firefly2",
						"_s3_enemy_1",
						"s3_enemy_1_1",
						"s3_enemy_1_2",
						"s3_enemy_1_3",
						"s3_enemy_1_4",
						"s3_enemy_1_5",
						"_s3_enemy_1_child",
						"s3_enemy_1_child_1",
						"s3_enemy_1_child_2",
						"_s3_enemy_2",
						"s3_enemy_1_child_3",
						"s3_enemy_1_child_4",
						"s3_enemy_1_child_5",
						"s3_enemy_2_1",
						"s3_enemy_2_2",
						"s3_enemy_2_3",
						"_s3_enemy_2_child",
						"s3_enemy_2_child_1",
						"s3_enemy_2_child_2",
						"s3_enemy_3",
						"s3_title",
					},
					disable = {
						"undefined-field",
						"redundant-parameter",
						"undefined-doc-name",
						"unused-global",
						"unused-local",
						"unused-function",
						"trailing-space",
						"undefined-doc-param",
						"duplicate-set-field",
						"discard-returns",
						"missing-parameter",
						"need-check-nil",
					},
				},
				workspace = {
					library = {
						[vim.fn.expand("$VIMRUNTIME/lua")] = true,
						[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
						[vim.fn.expand(
							"$HOME/Documents/[IN DEV]《东方天慾录 ～The Sealing of Prophet's Fantasy》/lib"
						)] = true,
					},
					maxPreload = 100000,
					preloadFileSize = 10000,
				},
				telemetry = { enable = false },
			},
		}
		opts.on_attach = function(client)
			client.resolved_capabilities.document_formatting = false
			custom_attach(client)
		end
	end,
	["clangd"] = function(opts)
		opts.args = {
			"--background-index",
			"-std=c++20",
			"--pch-storage=memory",
			"--clang-tidy",
			"--suggest-missing-includes",
		}
		opts.capabilities.offsetEncoding = { "utf-16" }
		opts.single_file_support = true
		opts.commands = {
			ClangdSwitchSourceHeader = {
				function()
					switch_source_header_splitcmd(0, "edit")
				end,
				description = "Open source/header in current buffer",
			},
			ClangdSwitchSourceHeaderVSplit = {
				function()
					switch_source_header_splitcmd(0, "vsplit")
				end,
				description = "Open source/header in a new vsplit",
			},
			ClangdSwitchSourceHeaderSplit = {
				function()
					switch_source_header_splitcmd(0, "split")
				end,
				description = "Open source/header in a new split",
			},
		}
		-- Disable `clangd`'s format
		opts.on_attach = function(client)
			client.resolved_capabilities.document_formatting = false
			custom_attach(client)
		end
	end,
	["jsonls"] = function(opts)
		opts.settings = {
			json = {
				-- Schemas https://www.schemastore.org
				schemas = {
					{
						fileMatch = { "package.json" },
						url = "https://json.schemastore.org/package.json",
					},
					{
						fileMatch = { "tsconfig*.json" },
						url = "https://json.schemastore.org/tsconfig.json",
					},
					{
						fileMatch = {
							".prettierrc",
							".prettierrc.json",
							"prettier.config.json",
						},
						url = "https://json.schemastore.org/prettierrc.json",
					},
					{
						fileMatch = { ".eslintrc", ".eslintrc.json" },
						url = "https://json.schemastore.org/eslintrc.json",
					},
					{
						fileMatch = {
							".babelrc",
							".babelrc.json",
							"babel.config.json",
						},
						url = "https://json.schemastore.org/babelrc.json",
					},
					{
						fileMatch = { "lerna.json" },
						url = "https://json.schemastore.org/lerna.json",
					},
					{
						fileMatch = {
							".stylelintrc",
							".stylelintrc.json",
							"stylelint.config.json",
						},
						url = "http://json.schemastore.org/stylelintrc.json",
					},
					{
						fileMatch = { "/.github/workflows/*" },
						url = "https://json.schemastore.org/github-workflow.json",
					},
				},
			},
		}
	end,
	["tsserver"] = function(opts)
		-- Disable `tsserver`'s format
		opts.on_attach = function(client)
			client.resolved_capabilities.document_formatting = false
			custom_attach(client)
		end
	end,
	["dockerls"] = function(opts)
		-- Disable `dockerls`'s format
		opts.on_attach = function(client)
			client.resolved_capabilities.document_formatting = false
			custom_attach(client)
		end
	end,
	["gopls"] = function(opts)
		opts.settings = {
			gopls = {
				usePlaceholders = true,
				analyses = {
					nilness = true,
					shadow = true,
					unusedparams = true,
					unusewrites = true,
				},
			},
		}
	end,
}

lsp_installer.on_server_ready(function(server)
	local opts = {
		capabilities = capabilities,
		flags = { debounce_text_changes = 500 },
		on_attach = custom_attach,
	}

	if enhance_server_opts[server.name] then
		enhance_server_opts[server.name](opts)
	end

	server:setup(opts)
end)

-- https://github.com/vscode-langservers/vscode-html-languageserver-bin

nvim_lsp.html.setup({
	cmd = { "html-languageserver", "--stdio" },
	filetypes = { "html" },
	init_options = {
		configurationSection = { "html", "css", "javascript" },
		embeddedLanguages = { css = true, javascript = true },
	},
	settings = {},
	single_file_support = true,
	flags = { debounce_text_changes = 500 },
	capabilities = capabilities,
	on_attach = function(client)
		client.resolved_capabilities.document_formatting = false
		custom_attach(client)
	end,
})

local efmls = require("efmls-configs")

-- Init `efm-langserver` here.

efmls.init({
	on_attach = custom_attach,
	capabilities = capabilities,
	init_options = { documentFormatting = true, codeAction = true },
})

-- Require `efmls-configs-nvim`'s config here

local vint = require("efmls-configs.linters.vint")
local clangtidy = require("efmls-configs.linters.clang_tidy")
local eslint = require("efmls-configs.linters.eslint")
local flake8 = require("efmls-configs.linters.flake8")
local shellcheck = require("efmls-configs.linters.shellcheck")

local black = require("efmls-configs.formatters.black")
local luafmt = require("efmls-configs.formatters.stylua")
local clangfmt = require("efmls-configs.formatters.clang_format")
local prettier = require("efmls-configs.formatters.prettier")
local shfmt = require("efmls-configs.formatters.shfmt")

-- Add your own config for formatter and linter here

-- local rustfmt = require("modules.completion.efm.formatters.rustfmt")

-- Override default config here

flake8 = vim.tbl_extend("force", flake8, {
	prefix = "flake8: max-line-length=160, ignore F403 and F405",
	lintStdin = true,
	lintIgnoreExitCode = true,
	lintFormats = { "%f:%l:%c: %t%n%n%n %m" },
	lintCommand = "flake8 --max-line-length 160 --extend-ignore F403,F405 --format '%(path)s:%(row)d:%(col)d: %(code)s %(code)s %(text)s' --stdin-display-name ${INPUT} -",
})

-- Setup formatter and linter for efmls here

efmls.setup({
	vim = { formatter = vint },
	lua = { formatter = luafmt },
	c = { formatter = clangfmt, linter = clangtidy },
	cpp = { formatter = clangfmt, linter = clangtidy },
	python = { formatter = black },
	vue = { formatter = prettier },
	typescript = { formatter = prettier, linter = eslint },
	javascript = { formatter = prettier, linter = eslint },
	typescriptreact = { formatter = prettier, linter = eslint },
	javascriptreact = { formatter = prettier, linter = eslint },
	yaml = { formatter = prettier },
	html = { formatter = prettier },
	css = { formatter = prettier },
	scss = { formatter = prettier },
	sh = { formatter = shfmt, linter = shellcheck },
	markdown = { formatter = prettier },
	-- rust = {formatter = rustfmt},
})
