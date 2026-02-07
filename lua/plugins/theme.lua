return {
  "e-ink-colorscheme/e-ink.nvim",
  name = "e-ink",
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd.colorscheme("e-ink")

    -- Custom highlight overrides
    local set_hl = vim.api.nvim_set_hl
    local palette = require("e-ink.palette")

    local mono = palette.mono()
    local everforest = palette.everforest()

    -- Mono (grayscale)
    set_hl(0, "Normal",      { fg = mono[15], bg = mono[1] })
    set_hl(0, "LineNr",      { fg = mono[8] })
    set_hl(0, "CursorLine",  { bg = mono[3] })
    set_hl(0, "Visual",      { bg = mono[5] })
    set_hl(0, "StatusLine",  { fg = mono[1], bg = mono[14] })
    set_hl(0, "Normal", { bg = "#282828" })
    set_hl(0, "Normal", { fg = mono[15], bg = "#282828" })

    -- Everforest accents
    set_hl(0, "Comment",     { fg = everforest.green, italic = true })
    set_hl(0, "Identifier",  { fg = everforest.blue })
    set_hl(0, "Function",    { fg = everforest.aqua })
    set_hl(0, "Keyword",     { fg = everforest.purple, bold = true })
    set_hl(0, "String",      { fg = everforest.orange })
    set_hl(0, "Number",      { fg = everforest.yellow })
    set_hl(0, "DiagnosticError", { fg = everforest.red })
    set_hl(0, "DiagnosticWarn",  { fg = everforest.yellow })
    set_hl(0, "Normal", { fg = mono[15], bg = "#282828" })

--    set_hl(0, "Normal", { fg = bg = "#282828" })

    --Markdown stuff
    set_hl(0, "@markup.heading.1.markdown", { fg = everforest.red, bold = true })
    set_hl(0, "@markup.heading.2.markdown", { fg = everforest.aqua, bold = true })
    set_hl(0, "@markup.heading.3.markdown", { fg = everforest.yellow })
    set_hl(0, "@markup.heading.4.markdown", { fg = everforest.green })
    set_hl(0, "@markup.heading.5.markdown", { fg = everforest.orange })
    set_hl(0, "@markup.heading.6.markdown", { fg = everforest.blue })

    --Markdown Stuff 2
    set_hl(0, "@markup.link.markdown",       { fg = everforest.blue, underline = true })
    set_hl(0, "@markup.list.markdown",       { fg = everforest.green })
    set_hl(0, "@markup.raw.markdown_inline", { fg = everforest.aqua })
    set_hl(0, "@markup.strong.markdown",     { bold = true })
    set_hl(0, "@markup.italic.markdown",     { italic = true })
  end,
}

