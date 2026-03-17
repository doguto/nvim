return {
  "dinhhuy258/git.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    default_mappings = true, -- quit_blame / blame_commit は false でも入る点に注意

    keymaps = {
      blame = "<Leader>gb",
      quit_blame = "q",
      blame_commit = "<CR>",
      quit_blame_commit = "q",
      browse = "<Leader>go",
      open_pull_request = "<Leader>gp",
      create_pull_request = "<Leader>gn",
      diff = "<Leader>gd",
      diff_close = "<Leader>gD",
      revert = "<Leader>gr",
      revert_file = "<Leader>gR",
    },

    target_branch = function()
      local handle =
        io.popen("git remote show origin 2>/dev/null | grep 'HEAD branch' | cut -d' ' -f5")
      if handle then
        local result = handle:read("*a")
        handle:close()
        local branch = result:match("^%s*(.-)%s*$")
        if branch and branch ~= "" then
          return branch
        end
      end
      return "master"
    end,

    private_gitlabs = { "https://xxx.git.com" },

    winbar = false,
  },
}
