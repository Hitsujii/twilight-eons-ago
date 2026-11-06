local p = {
  bg = "#1C1C1C",
  fg = "#E7EADD",
  cursor = "#E7EADD",
  ansi = {
    "#141414", -- 0
    "#B38E83", -- 1
    "#A9BC8E", -- 2
    "#C2BC8A", -- 3
    "#41484B", -- 4
    "#A3B59C", -- 5
    "#84918E", -- 6
    "#E7EADD", -- 7
    "#262626", -- 8
    "#CDAA9A", -- 9
    "#C7D6A3", -- 10
    "#DFD3A1", -- 11
    "#8D9492", -- 12
    "#C3CFAD", -- 13
    "#ABBCC0", -- 14
    "#F0F1E7", -- 15
  },
}
local a = p.ansi

local syntax = {
  variable = p.fg,
  namespace = "#A7B7BA",
  stdlib_variable = "#B7C3C3",
  parameter = "#D0D6C4",
  property = "#BBC6B0",
  type = "#D8CEA7",
  func = a[11],
  string = a[3],
  number = "#D2B694",
  constant = "#E0D8B8",
  keyword = a[10],
  operator = "#B2BCB3",
  punctuation = "#9BA59C",
  comment = "#80897C",
  preproc = "#AEB99F",
  macro = "#D5CB9C",
  special = "#C7A59A",
}

local ui = {
  visual = "#333B35",
  cursor_highlight = "#282D29",
  panel_bg = a[1],
  border = "#637168",
  line_nr = "#6B766F",
  inactive = "#84918E",
  nontext = "#697477",
  inlay_hint = "#697477",
  indent = "#4E5A52",
  indent_scope = a[11],
}

return { p = p, syntax = syntax, ui = ui }
