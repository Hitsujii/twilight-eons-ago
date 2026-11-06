local M = {}

function M.load()
  local palette = require("twilight-eons-ago.palette")
  local p, syntax, ui = palette.p, palette.syntax, palette.ui
  local a = p.ansi

  local api = vim.api
  local panel_group_name = "TwilightEonsAgoPanels"

  -- Reset panels
  if vim.fn.exists("#" .. panel_group_name .. "#ColorSchemePre") == 1 then
    api.nvim_exec_autocmds("ColorSchemePre", { group = panel_group_name, modeline = false })
  end

  vim.o.background = "dark"
  vim.o.termguicolors = true
  vim.cmd("highlight clear")
  vim.g.colors_name = "twilight-eons-ago"

  local function set(group, spec)
    api.nvim_set_hl(0, group, spec)
  end
  local function link(group, target)
    set(group, { link = target })
  end

  -- ANSI 0-15
  for i = 0, 15 do
    vim.g["terminal_color_" .. i] = a[i + 1]
  end

  -- Interface
  set("Normal", { fg = p.fg, bg = p.bg })
  set("NormalNC", { fg = p.fg, bg = p.bg })
  set("NormalFloat", { fg = p.fg, bg = p.bg })
  set("FloatBorder", { fg = ui.border, bg = p.bg })
  set("FloatTitle", { fg = a[11], bg = p.bg, bold = true })
  set("SignColumn", { fg = a[15], bg = p.bg })
  set("LineNr", { fg = ui.line_nr, bg = p.bg })
  set("CursorLineNr", { fg = a[12], bg = p.bg, bold = true })
  set("CursorLine", { bg = ui.cursor_highlight })
  set("CursorColumn", { bg = ui.cursor_highlight })
  set("ColorColumn", { bg = a[9] })
  set("EndOfBuffer", { fg = p.bg, bg = p.bg })
  set("NonText", { fg = ui.nontext })
  set("Whitespace", { fg = a[5] })
  set("SpecialKey", { fg = ui.nontext })
  set("Conceal", { fg = a[7] })
  set("WinSeparator", { fg = a[9], bg = p.bg })
  link("VertSplit", "WinSeparator")
  set("Folded", { fg = a[15], bg = a[9] })
  set("FoldColumn", { fg = ui.line_nr, bg = p.bg })
  set("StatusLine", { fg = p.fg, bg = a[9] })
  set("StatusLineNC", { fg = ui.inactive, bg = p.bg })
  set("TabLine", { fg = ui.inactive, bg = p.bg })
  set("TabLineSel", { fg = p.fg, bg = a[9], bold = true })
  set("TabLineFill", { bg = p.bg })
  set("WinBar", { fg = p.fg, bg = p.bg })
  set("WinBarNC", { fg = ui.inactive, bg = p.bg })
  set("Pmenu", { fg = p.fg, bg = a[9] })
  set("PmenuSel", { fg = p.fg, bg = a[5], bold = true })
  set("PmenuSbar", { bg = a[9] })
  set("PmenuThumb", { bg = a[7] })
  set("PmenuMatch", { fg = a[11], bold = true })
  link("WildMenu", "PmenuSel")
  set("Visual", { bg = ui.visual })
  set("Search", { fg = p.bg, bg = a[4] })
  set("IncSearch", { fg = p.bg, bg = a[12], bold = true })
  link("CurSearch", "IncSearch")
  link("Substitute", "IncSearch")
  set("MatchParen", { fg = a[12], bold = true, underline = true })
  set("Cursor", { fg = p.bg, bg = p.cursor })
  link("TermCursor", "Cursor")
  set("Directory", { fg = a[11] })
  set("Title", { fg = a[12], bold = true })
  set("Question", { fg = a[11] })
  set("MoreMsg", { fg = a[11] })
  set("ModeMsg", { fg = p.fg, bold = true })
  set("ErrorMsg", { fg = a[10] })
  set("WarningMsg", { fg = a[12] })
  set("MsgArea", { fg = p.fg, bg = p.bg })
  set("QuickFixLine", { bg = a[9] })
  set("SpellBad", { sp = a[2], undercurl = true })
  set("SpellCap", { sp = a[15], undercurl = true })
  set("SpellLocal", { sp = a[3], undercurl = true })
  set("SpellRare", { sp = a[6], undercurl = true })
  set("DiffAdd", { fg = a[11], bg = a[9] })
  set("DiffChange", { fg = a[12], bg = a[9] })
  set("DiffDelete", { fg = a[10], bg = a[9] })
  set("DiffText", { fg = p.fg, bg = a[5], bold = true })

  -- Panels
  set("TwilightPanel", { fg = p.fg, bg = ui.panel_bg })
  set("TwilightPanelEndOfBuffer", { fg = ui.panel_bg, bg = ui.panel_bg })
  set("TwilightPanelSignColumn", { fg = a[15], bg = ui.panel_bg })
  set("TwilightPanelLineNr", { fg = ui.line_nr, bg = ui.panel_bg })
  set("TwilightPanelCursorLineNr", { fg = a[12], bg = ui.panel_bg, bold = true })
  set("TwilightPanelBorder", { fg = ui.border, bg = ui.panel_bg })
  set("TwilightPanelSeparator", { fg = a[9], bg = p.bg })
  set("TwilightPanelTitle", { fg = a[12], bg = ui.panel_bg, bold = true })
  set("TwilightPanelWinBar", { fg = p.fg, bg = ui.panel_bg })
  set("TwilightPanelWinBarNC", { fg = ui.inactive, bg = ui.panel_bg })

  -- Syntax
  set("Comment", { fg = syntax.comment, italic = true })
  set("Constant", { fg = syntax.constant })
  set("String", { fg = syntax.string })
  link("Character", "String")
  set("Number", { fg = syntax.number })
  link("Boolean", "Number")
  link("Float", "Number")
  set("Identifier", { fg = syntax.variable })
  set("Function", { fg = syntax.func })
  set("Statement", { fg = syntax.keyword })
  set("Keyword", { fg = syntax.keyword })
  link("Conditional", "Statement")
  link("Repeat", "Statement")
  link("Label", "Statement")
  link("Exception", "Statement")
  set("Operator", { fg = syntax.operator })
  set("PreProc", { fg = syntax.preproc })
  link("Include", "PreProc")
  link("Define", "PreProc")
  set("Macro", { fg = syntax.macro })
  link("PreCondit", "PreProc")
  set("Type", { fg = syntax.type })
  link("StorageClass", "Keyword")
  link("Structure", "Type")
  link("Typedef", "Type")
  set("Special", { fg = syntax.special })
  link("SpecialChar", "Special")
  set("Delimiter", { fg = syntax.punctuation })
  set("Tag", { fg = syntax.type })
  set("Todo", { fg = p.bg, bg = a[12], bold = true })
  set("Underlined", { fg = a[11], underline = true })
  set("Error", { fg = a[10], bold = true })

  set("Namespace", { fg = syntax.namespace })
  set("StdLibVariable", { fg = syntax.stdlib_variable })
  set("TwilightParameter", { fg = syntax.parameter })
  set("TwilightProperty", { fg = syntax.property })

  -- Tree-sitter
  local captures = {
    ["@comment"] = "Comment",
    ["@comment.documentation"] = "Comment",
    ["@comment.todo"] = "Todo",
    ["@comment.warning"] = "Todo",
    ["@comment.error"] = "Error",
    ["@string"] = "String",
    ["@string.documentation"] = "String",
    ["@string.escape"] = "Special",
    ["@string.regexp"] = "Special",
    ["@string.special"] = "Special",
    ["@character"] = "Character",
    ["@number"] = "Number",
    ["@number.float"] = "Number",
    ["@boolean"] = "Boolean",
    ["@constant"] = "Constant",
    ["@constant.builtin"] = "Constant",
    ["@constant.macro"] = "Macro",
    ["@variable"] = "Identifier",
    ["@variable.parameter"] = "TwilightParameter",
    ["@variable.member"] = "TwilightProperty",
    ["@variable.builtin"] = "Special",
    ["@property"] = "TwilightProperty",
    ["@field"] = "TwilightProperty",
    ["@module"] = "Namespace",
    ["@namespace"] = "Namespace",
    ["@function"] = "Function",
    ["@function.builtin"] = "Function",
    ["@function.call"] = "Function",
    ["@function.method"] = "Function",
    ["@function.method.call"] = "Function",
    ["@function.macro"] = "Macro",
    ["@constructor"] = "Function",
    ["@method"] = "Function",
    ["@method.call"] = "Function",
    ["@keyword"] = "Keyword",
    ["@keyword.function"] = "Keyword",
    ["@keyword.operator"] = "Keyword",
    ["@keyword.import"] = "PreProc",
    ["@keyword.directive"] = "PreProc",
    ["@keyword.directive.define"] = "PreProc",
    ["@keyword.modifier"] = "Keyword",
    ["@keyword.type"] = "Keyword",
    ["@keyword.return"] = "Statement",
    ["@keyword.repeat"] = "Statement",
    ["@keyword.conditional"] = "Statement",
    ["@keyword.exception"] = "Statement",
    ["@conditional"] = "Statement",
    ["@repeat"] = "Statement",
    ["@include"] = "PreProc",
    ["@operator"] = "Operator",
    ["@type"] = "Type",
    ["@type.builtin"] = "Type",
    ["@type.definition"] = "Type",
    ["@type.qualifier"] = "Keyword",
    ["@storageclass"] = "Keyword",
    ["@structure"] = "Type",
    ["@attribute"] = "Special",
    ["@attribute.builtin"] = "Special",
    ["@tag"] = "Tag",
    ["@tag.attribute"] = "TwilightProperty",
    ["@tag.delimiter"] = "Delimiter",
    ["@punctuation.delimiter"] = "Delimiter",
    ["@punctuation.bracket"] = "Delimiter",
    ["@punctuation.special"] = "Special",
    ["@markup.heading"] = "Title",
    ["@markup.italic"] = "Comment",
    ["@markup.link"] = "Underlined",
    ["@markup.raw"] = "String",
    ["@diff.plus"] = "DiffAdd",
    ["@diff.minus"] = "DiffDelete",
    ["@diff.delta"] = "DiffChange",
  }
  for group, target in pairs(captures) do
    link(group, target)
  end

  -- Markup
  set("@markup.strong", { fg = syntax.special, bold = true })

  -- LSP
  set("LspInlayHint", { fg = ui.inlay_hint })
  local semantic = {
    parameter = "@variable.parameter",
    property = "@variable.member",
    ["function"] = "@function",
    method = "@function.method",
    namespace = "@module",
    class = "@type",
    struct = "@type",
    enum = "@type",
    interface = "@type",
    type = "@type",
    typeParameter = "@type",
    typeAlias = "@type.definition",
    macro = "Macro",
    keyword = "Keyword",
    modifier = "Keyword",
    comment = "Comment",
    enumMember = "Constant",
    string = "String",
    number = "Number",
    boolean = "Boolean",
    operator = "Operator",
  }
  for token, target in pairs(semantic) do
    link("@lsp.type." .. token, target)
  end

  -- C++
  link("@lsp.typemod.variable.defaultLibrary.cpp", "StdLibVariable")
  link("@lsp.typemod.method.defaultLibrary.cpp", "Function")
  link("@lsp.typemod.function.defaultLibrary.cpp", "Function")

  -- Diagnostics
  for kind, color in pairs({ Error = a[10], Warn = a[12], Info = a[15], Hint = a[11], Ok = a[11] }) do
    set("Diagnostic" .. kind, { fg = color })
    set("DiagnosticSign" .. kind, { fg = color, bg = p.bg })
    set("DiagnosticVirtualText" .. kind, { fg = color, bg = p.bg })
    set("DiagnosticUnderline" .. kind, { sp = color, undercurl = true })
  end

  -- Plugins
  set("GitSignsAdd", { fg = a[11], bg = p.bg })
  set("GitSignsChange", { fg = a[12], bg = p.bg })
  set("GitSignsDelete", { fg = a[10], bg = p.bg })
  set("WhichKey", { fg = a[11] })
  set("WhichKeyGroup", { fg = a[12] })
  set("WhichKeyDesc", { fg = p.fg })
  set("SnacksPickerBorder", { fg = ui.border, bg = p.bg })
  set("SnacksPickerTitle", { fg = a[12], bg = p.bg, bold = true })
  set("SnacksPickerMatch", { fg = a[11], bold = true })
  set("SnacksPickerDir", { fg = ui.inactive })
  set("SnacksIndent", { fg = ui.indent })
  set("SnacksIndentScope", { fg = ui.indent_scope })
  set("BlinkCmpMenu", { fg = p.fg, bg = a[9] })
  set("BlinkCmpMenuBorder", { fg = ui.border, bg = a[9] })
  set("BlinkCmpLabelMatch", { fg = a[11], bold = true })
  set("LazyNormal", { fg = p.fg, bg = p.bg })
  set("LazyButton", { fg = p.fg, bg = a[9] })
  set("LazyButtonActive", { fg = p.bg, bg = a[11] })

  -- Icons
  set("MiniIconsAzure", { fg = a[15] })
  set("MiniIconsBlue", { fg = a[7] })
  set("MiniIconsCyan", { fg = a[15] })
  set("MiniIconsGreen", { fg = a[3] })
  set("MiniIconsGrey", { fg = a[7] })
  set("MiniIconsOrange", { fg = a[2] })
  set("MiniIconsPurple", { fg = a[6] })
  set("MiniIconsRed", { fg = a[10] })
  set("MiniIconsYellow", { fg = a[4] })

  -- Panel mappings
  local panel_highlights = {
    Normal = "TwilightPanel",
    NormalNC = "TwilightPanel",
    NormalFloat = "TwilightPanel",
    EndOfBuffer = "TwilightPanelEndOfBuffer",
    SignColumn = "TwilightPanelSignColumn",
    LineNr = "TwilightPanelLineNr",
    CursorLineNr = "TwilightPanelCursorLineNr",
    FoldColumn = "TwilightPanelLineNr",
    FloatBorder = "TwilightPanelBorder",
    FloatTitle = "TwilightPanelTitle",
    FloatFooter = "TwilightPanelTitle",
    WinBar = "TwilightPanelWinBar",
    WinBarNC = "TwilightPanelWinBarNC",
    WinSeparator = "TwilightPanelSeparator",
    VertSplit = "TwilightPanelSeparator",
    SnacksPickerTitle = "TwilightPanelTitle",
    SnacksPickerInputTitle = "TwilightPanelTitle",
    SnacksPickerListTitle = "TwilightPanelTitle",
    SnacksPickerBoxTitle = "TwilightPanelTitle",
  }

  local panel_group = api.nvim_create_augroup(panel_group_name, { clear = true })
  local active, pending = true, false

  local function read_winhighlight(win)
    local highlights = {}
    for source, target in vim.wo[win].winhighlight:gmatch("([^,:]+):([^,]*)") do
      highlights[source] = target
    end
    return highlights
  end

  local function write_winhighlight(win, highlights)
    local entries = {}
    for source, target in pairs(highlights) do
      entries[#entries + 1] = source .. ":" .. target
    end
    table.sort(entries)
    local value = table.concat(entries, ",")
    if vim.wo[win].winhighlight ~= value then
      vim.wo[win].winhighlight = value
    end
  end

  local function update_panel(win, enabled)
    local saved = vim.w[win].twilight_eons_ago_panel or {}
    local current = read_winhighlight(win)
    local changed = false

    for source, target in pairs(panel_highlights) do
      if enabled and current[source] ~= target then
        saved[source] = current[source] or false -- No previous mapping
        current[source] = target
        changed = true
      elseif not enabled and current[source] == target then
        current[source] = saved[source] or nil
        changed = true
      end
    end

    vim.w[win].twilight_eons_ago_panel = enabled and saved or nil
    if changed then
      write_winhighlight(win, current)
    end
  end

  -- Snacks Explorer
  local function explorer_windows()
    local windows = {}
    local picker = package.loaded["snacks.picker"]
    if type(picker) ~= "table" or type(picker.get) ~= "function" then
      return windows
    end

    local function add(window)
      if window and window.win and api.nvim_win_is_valid(window.win) then
        if window.buf == api.nvim_win_get_buf(window.win) then
          windows[window.win] = true
        end
      end
    end

    for _, explorer in ipairs(picker.get({ source = "explorer", tab = false })) do
      if explorer.layout then
        add(explorer.layout.root)
        for _, window in pairs(explorer.layout.box_wins or {}) do
          add(window)
        end
      end
      add(explorer.list and explorer.list.win)
      add(explorer.input and explorer.input.win)
    end
    return windows
  end

  local function refresh_panels()
    local explorers = explorer_windows()
    for _, win in ipairs(api.nvim_list_wins()) do
      if api.nvim_win_is_valid(win) then
        local buf = api.nvim_win_get_buf(win)
        update_panel(win, vim.bo[buf].buftype == "terminal" or explorers[win] == true)
      end
    end
  end

  local function schedule_refresh()
    if not active or pending then
      return
    end
    pending = true
    vim.schedule(function()
      local ok, err = true, nil
      if active and vim.g.colors_name == "twilight-eons-ago" then
        ok, err = pcall(refresh_panels)
      end
      pending = false
      if not ok then
        vim.notify(tostring(err), vim.log.levels.ERROR, { title = "Twilight Eons Ago" })
      end
    end)
  end

  -- Events
  api.nvim_create_autocmd({ "TermOpen", "BufWinEnter", "WinEnter", "WinNew", "TabEnter", "WinResized" }, {
    group = panel_group,
    desc = "Refresh Twilight panels",
    callback = schedule_refresh,
  })

  api.nvim_create_autocmd("OptionSet", {
    group = panel_group,
    pattern = "winhighlight",
    desc = "Refresh Twilight mappings",
    callback = schedule_refresh,
  })

  api.nvim_create_autocmd("ColorScheme", {
    group = panel_group,
    pattern = "twilight-eons-ago",
    callback = schedule_refresh,
  })

  api.nvim_create_autocmd("ColorSchemePre", {
    group = panel_group,
    desc = "Restore window highlights",
    callback = function()
      active = false
      api.nvim_clear_autocmds({ group = panel_group })
      for _, win in ipairs(api.nvim_list_wins()) do
        if api.nvim_win_is_valid(win) then
          update_panel(win, false)
        end
      end
    end,
  })

  schedule_refresh()
end

return M
