return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      sources = {
        -- Mostra arquivos ignorados pelo git e arquivos ocultos por padrão
        files = {
          hidden = true,
          ignored = true,
        },
        grep = {
          hidden = true,
          ignored = true,
        },
        git_files = {
          untracked = true,
        },
      },
    },
  },
}
