-- Keymap to split comma separated values onto separate lines, for uses blocks
vim.keymap.set('v', '<leader>rs', ':s/, /,\\r/g<CR>vip=', { desc = 'Split on ,space into separate lines' })



-- Wrap uses in sort directives
local function wrap_uses_range(type)
  local buf = 0

  -- Get range from marks set by operatorfunc
  local start = vim.api.nvim_buf_get_mark(buf, "[")
  local finish = vim.api.nvim_buf_get_mark(buf, "]")

  local start_row = start[1] - 1
  local end_row = finish[1]

  local lines = vim.api.nvim_buf_get_lines(buf, start_row, end_row, false)
  local text = table.concat(lines, "\n")

  local new = text:gsub("uses%s*(.-);", function(block)
    if not block:match("^\n") then
      block = "\n" .. block
    end
    return "uses\n{**sortuse**}" .. block .. ";\n{**endsortuse**}"
  end, 1)

  if new ~= text then
    vim.api.nvim_buf_set_lines(buf, start_row, end_row, false, vim.split(new, "\n"))
  end
end

-- operator-pending mapping
vim.keymap.set("n", "<leader>ju", function()
  vim.o.operatorfunc = "v:lua.wrap_uses_range"
  return "g@"
end, { expr = true, desc = "Wrap uses block (operator)" })

-- expose globally
_G.wrap_uses_range = wrap_uses_range

vim.keymap.set("n", "<leader>jj", "<leader>juip", { remap = true, desc = "Wrap uses block in paragraph" })




-- Search for uses
local WORD = "^\\s*uses"

local function next_match()
  vim.fn.search(WORD)
end

local function prev_match()
  vim.fn.search(WORD, "b")
end

vim.keymap.set("n", "]u", next_match)
vim.keymap.set("n", "[u", prev_match)
