vim.o.completeopt = 'menuone,noselect'


local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
    return
end

local has_words_before = function()
    if vim.api.nvim_buf_get_option(0, 'buftype') == 'prompt' then
        return false
    end
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line-1, line, true)[1]:sub(col, col):match('%s') == nil
end

-- Add lspkind
local lspkind = require('lspkind')


local source_mapping = {
    buffer = "[Buffer]",
    nvim_lsp = "[LSP]",
    nvim_lua = "[Lua]",
    cmp_tabnine = "[TN]",
    path = "[Path]",
    dictionary = "[Dict]",
    emoji = "[Emoji]",
}



cmp.setup({
    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
            -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
            -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
            -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        end,
    },

    formatting = {
        format = function(entry, vim_item)
            vim_item.kind = lspkind.presets.default[vim_item.kind]
            local menu = source_mapping[entry.source.name]
            if entry.source.name == 'cmp_tabnine' then
                if entry.completion_item.data ~= nil and entry.completion_item.data.detail ~= nil then
                    menu = entry.completion_item.data.detail .. ' ' .. menu
                end
                -- vim_item.kind = ''
            end
            -- if entry.source.name == 'dictionary' then
            --     if entry.completion_item.data ~= nil and entry.completion_item.data.detail ~= nil then
            --         menu = entry.completion_item.data.detail .. ' ' .. menu
            --     end
            --     vim_item.kind = ''
            -- end
            vim_item.menu = menu
            return vim_item
        end
    },
    mapping = {
        -- ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
        -- ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
        -- ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
        ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
        ['<C-b>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
        ['<C-f>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
        ['<C-e>'] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        }),
        ['<CR>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ['<Tab>'] = function(fallback)  -- see GH-231, GH-286
            if cmp.visible() then cmp.select_next_item()
            elseif has_words_before() then cmp.complete()
            else fallback() end
        end,
        ['<S-Tab>'] = function(fallback)
            if cmp.visible() then cmp.select_prev_item()
            else fallback() end
        end,
    },
    sources = {
        { name = "nvim_lsp", priority = 100 }, -- Keep LSP results on top.
        { name = "nvim_lua" },
        -- { name = 'vsnip' }, -- For vsnip users.
        -- { name = "luasnip" },
        { name = "buffer" ,keyword_pattern = [[\k]] ,priority = 90},
        { name = "cmp_tabnine" , priority = 85 },
        { name = "path" },
        {name = 'emoji', insert = true},
        {
            name = "dictionary",
            keyword_length = 2,
            priority = 80,
        },
    },
    -- confirm_opts = {
    --     behavior = cmp.ConfirmBehavior.Replace,
    --     select = false,
    -- },
    -- documentation = false,
    -- documentation = {
    -- 	border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
    -- },
    -- ghost_text 用了之后preview box 就无法正常使用了.
    experimental = {
        ghost_text = true,
        native_menu = false,
    },
})

