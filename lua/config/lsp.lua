vim.lsp.enable({
  -- nvim-lspconfig で"lua_ls"という名前で設定したプリセットが読まれる
  -- https://github.com/neovim/nvim-lspconfig/blob/master/lsp/lua_ls.lua
  "lua_ls",
  -- 他の言語サーバーの設定
  -- "gopls",
})

-- 言語サーバーがアタッチされた時に呼ばれる
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("my.lsp", {}),
  callback = function(args)
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
    local buf = args.buf

    if client:supports_method("textDocument/completion") then
      vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
    end

    -- LSP キーマップ
    local opts = { buffer = buf, noremap = true, silent = true }
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, vim.tbl_extend("force", opts, { desc = "定義へジャンプ" }))
    vim.keymap.set("n", "gr", vim.lsp.buf.rename, vim.tbl_extend("force", opts, { desc = "リネーム" }))

    -- Auto-format ("lint") on save.
    -- Usually not needed if server supports "textDocument/willSaveWaitUntil".
    if not client:supports_method("textDocument/willSaveWaitUntil")
        and client:supports_method("textDocument/formatting") then
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = vim.api.nvim_create_augroup("my.lsp", { clear = false }),
        buffer = args.buf,
        callback = function()
          vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
        end,
      })
    end
  end,
})
