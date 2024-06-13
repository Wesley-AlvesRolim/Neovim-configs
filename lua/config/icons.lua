local diagnostics = {
  Error = "󰅚 ", --🅴," ""󰢃 "
  Warn = "󰀪 ", --🆆," "
  Hint = "󰌶 ", --🅸,"" "󰛩 "
  Info = " ", --🅷," ","󰗡 "
}

return {
  diagnostics = diagnostics,
  signs = {
    { name = "DiagnosticSignError", text = diagnostics.Error },
    { name = "DiagnosticSignWarn", text = diagnostics.Warn },
    { name = "DiagnosticSignHint", text = diagnostics.Hint },
    { name = "DiagnosticSignInfo", text = diagnostics.Info },
  },
  git = {
    add = { text = "│" }, --" ","▎"
    change = { text = "!" }, --" ",
    delete = { text = "_" }, --" ",""
    topdelete = { text = "‾" },
    changedelete = { text = "" },
    untracked = { text = "┆" },
  },
  kinds = {
    Array = " ",
    Boolean = " ",
    Class = " ", --"󰠱 ",
    Color = "  ", --"󰏘 ", "󰸌 "
    Constant = " ",
    Constructor = "",
    Copilot = " ",
    Codeium = " ",
    Enum = " ",
    EnumMember = "",
    Event = " ", --"",
    Field = "󰄶 ", --"󰘻 ","󰄷 "
    File = "󰈙", -- 󰷈 󱪗 󱪝
    Folder = "  ", --󰉋  
    Function = "󰊕", --"󰡱 "
    Interface = " ", --"",
    Keyword = "󰌋 ", --"󱕵"
    Method = "󰆧 ",
    Module = " ",
    Namespace = " ",
    Null = " ",
    Number = " ",
    Object = " ",
    Operator = " ", --"󰆕",
    Package = "󰏗 ",
    Property = " ", --" ",󱉯
    Reference = " ", --"",
    Snippet = " ",
    String = " ",
    Struct = " ", --" ",
    Text = "󰊄 ", --" ",󰚞
    TypeParameter = " ",
    Unit = " ", --"",
    Value = "󰎠",
    Variable = "󰘛 ",
  },
}
