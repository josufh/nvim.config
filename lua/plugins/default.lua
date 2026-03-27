return {
        {
                "mason-org/mason.nvim",
                opts = {
                        ensure_installed = {
                                "stylua",
                                "shellcheck",
                                "shfmt",
                                "flake8",
                                "omnisharp",
                                "markdownlint-cli2",
                                "markdown-toc",
                        },
                },
        },

        {
                "nvim-treesitter/nvim-treesitter",
                opts = {
                        ensure_installed = {
                                "bash",
                                "html",
                                "javascript",
                                "json",
                                "lua",
                                "python",
                                "query",
                                "regex",
                                "tsx",
                                "typescript",
                                "vim",
                                "yaml",
                                "c_sharp",
                                "typst",
                                "nasm",
                        },
                },
        },

        {
                "neovim/nvim-lspconfig",
                opts = {
                        servers = {
                                tinymist = {
                                        keys = {
                                                {
                                                        "<leader>cP",
                                                        function()
                                                                local buf_name = vim.api.nvim_buf_get_name(0)
                                                                local file_name = vim.fn.fnamemodify(buf_name, ":t")
                                                                LazyVim.lsp.execute({
                                                                        title = "Pin Main",
                                                                        filter = "tinymist",
                                                                        command = "tinymist.pinMain",
                                                                        arguments = { buf_name },
                                                                })
                                                                LazyVim.info("Tinymist: Pinned " .. file_name)
                                                        end,
                                                        desc = "Pin main file",
                                                },
                                        },
                                        single_file_support = true, -- Fixes LSP attachment in non-Git directories
                                        settings = {
                                                formatterMode = "typstyle",
                                        },
                                },
                                marksman = {},
                        },
                },
        },

        {
                "chomosuke/typst-preview.nvim",
                cmd = { "TypstPreview", "TypstPreviewToggle", "TypstPreviewUpdate" },
                keys = {
                        {
                                "<leader>cp",
                                ft = "typst",
                                "<cmd>TypstPreviewToggle<cr>",
                                desc = "Toggle Typst Preview",
                        },
                },
                opts = {
                        dependencies_bin = {
                                tinymist = "tinymist",
                        },
                },
        },

        {
                "folke/ts-comments.nvim",
                opts = {
                        lang = {
                                typst = { "// %s", "/* %s */" },
                        },
                },
        },

        {
                "markdown-preview.nvim",
        },

        {
                "iamcco/markdown-preview.nvim",
                cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownreviewStop" },
                build = function()
                        require("lazy").load({ plugins = { "markdown-preview.nvim" } })
                        vim.fn["mkdp#util#install"]()
                end,
                keys = {
                        {
                                "<leader>cp",
                                ft = "markdown",
                                "<cmd>MarkdownPreviewToggle<cr>",
                                desc = "Markdown Preview",
                        },
                },
                config = function()
                        vim.cmd([[do Filetype]])
                end,
        },

        {
                "MeanderingProgrammer/render-markdown.nvim",
                opts = {
                        code = {
                                sign = false,
                                width = "block",
                                right_pad = 1,
                        },
                        heading = {
                                sign = false,
                                icons = {},
                        },
                        checkbox = {
                                enabled = false,
                        },
                },
                ft = { "markdown", "norg", "rmd", "org", "codecompanion" },
                config = function(_, opts)
                        require("render-markdown").setup(opts)
                        Snacks.toggle({
                                name = "Render Markdown",
                                get = require("render-markdown").get,
                                set = require("render-markdown").set,
                        }):map("<leader>um")
                end,
        },
}
