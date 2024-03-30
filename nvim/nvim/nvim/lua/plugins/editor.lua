return {

    {
        "nvim-neo-tree/neo-tree.nvim",
        dependencies = {
          "nvim-lua/plenary.nvim",
          "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
          "MunifTanjim/nui.nvim",
          -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
        },
        keys = {
            {
                "<leader>e",
                function()
                  require("neo-tree.command").execute({ toggle = true, dir = vim.uv.cwd() })
                end,
                desc = "Explorer NeoTree (cwd)",
            },
        },
        opts = {
            sources = { "filesystem", "buffers", "git_status", "document_symbols" },
            source_selector = {
                winbar = true
            },
            window = {
                position = "right"
            },
            filesystem = {
                bind_to_cwd = true,
                cwd_target = {
                    sidebar = "tab",   -- sidebar is when position = left or right
                    current = "window" -- current is when position = current
                }
            }
        }
    },


    {
        "nvim-pack/nvim-spectre",
        build = false,
        cmd = "Spectre",
        opts = { open_cmd = "noswapfile vnew" },
        -- stylua: ignore
        keys = {
          { "<leader>sr", function() require("spectre").open() end, desc = "Replace in Files (Spectre)" },
        },
    },

    {
        "RRethy/vim-illuminate",
        opts = {
          delay = 200,
          large_file_cutoff = 2000,
          large_file_overrides = {
            providers = { "lsp" },
          },
        },
        config = function(_, opts)
          require("illuminate").configure(opts)

          local function map(key, dir, buffer)
            vim.keymap.set("n", key, function()
              require("illuminate")["goto_" .. dir .. "_reference"](false)
            end, { desc = dir:sub(1, 1):upper() .. dir:sub(2) .. " Reference", buffer = buffer })
          end

          map("]]", "next")
          map("[[", "prev")

          -- also set it after loading ftplugins, since a lot overwrite [[ and ]]
          vim.api.nvim_create_autocmd("FileType", {
            callback = function()
              local buffer = vim.api.nvim_get_current_buf()
              map("]]", "next", buffer)
              map("[[", "prev", buffer)
            end,
          })
        end,
        keys = {
          { "]]", desc = "Next Reference" },
          { "[[", desc = "Prev Reference" },
        },
    },

    {
      'stevearc/conform.nvim',
      opts = {},
    },

    {
        "nvim-treesitter/nvim-treesitter",
        version = false,
        build = ":TSUpdate",
        init = function()
            require("nvim-treesitter.query_predicates")
        end,
        dependencies = {
            {
                "nvim-treesitter/nvim-treesitter-textobjects",
                config = function()
                  -- When in diff mode, we want to use the default
                  -- vim text objects c & C instead of the treesitter ones.
                  local move = require("nvim-treesitter.textobjects.move") ---@type table<string,fun(...)>
                  local configs = require("nvim-treesitter.configs")
                  for name, fn in pairs(move) do
                    if name:find("goto") == 1 then
                      move[name] = function(q, ...)
                        if vim.wo.diff then
                          local config = configs.get_module("textobjects.move")[name] ---@type table<string,string>
                          for key, query in pairs(config or {}) do
                            if q == query and key:find("[%]%[][cC]") then
                              vim.cmd("normal! " .. key)
                              return
                            end
                          end
                        end
                        return fn(q, ...)
                      end
                    end
                  end
                end,
            }
        },
        cmd = {"TSUpdateSync", "TSUpdate", "TSInstall"},
        keys = {

        },
        opts = {
            highlight = { enable = true },
            indent = { enable = true },
            ensure_installed = {
                "bash",
                "c",
                "diff",
                "html",
                "javascript",
                "jsdoc",
                "json",
                "jsonc",
                "lua",
                "luadoc",
                "luap",
                "markdown",
                "markdown_inline",
                "python",
                "query",
                "regex",
                "toml",
                "tsx",
                "typescript",
                "vim",
                "vimdoc",
                "xml",
                "yaml",
            },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<C-space>",
                    node_incremental = "<C-space>",
                    scope_incremental = false,
                    node_decremental = "<bs>",
                },
            },
            textobjects = {
                move = {
                    enable = true,
                    goto_next_start = { ["]f"] = "@function.outer", ["]c"] = "@class.outer" },
                    goto_next_end = { ["]F"] = "@function.outer", ["]C"] = "@class.outer" },
                    goto_previous_start = { ["[f"] = "@function.outer", ["[c"] = "@class.outer" },
                    goto_previous_end = { ["[F"] = "@function.outer", ["[C"] = "@class.outer" },
                },
            },
        },
        config = function(_, opts)
            if type(opts.ensure_installed) == "table" then
                local added = {}
                opts.ensure_installed = vim.tbl_filter(function(lang)
                    if added[lang] then
                        return false
                    end
                    added[lang] = true
                    return true
                end, opts.ensure_installed)
            end
          require("nvim-treesitter.configs").setup(opts)
        end,
    },

    { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },

    { "HiPhish/rainbow-delimiters.nvim"},

    -- DAP

    {
        "mfussenegger/nvim-dap",
        dependencies = {
            {
                "rcarriga/nvim-dap-ui",
                dependencies = { "nvim-neotest/nvim-nio" },
                -- stylua: ignore
                keys = {
                    { "<leader>du", function() require("dapui").toggle({ }) end, desc = "Dap UI" },
                    { "<leader>de", function() require("dapui").eval() end, desc = "Eval", mode = {"n", "v"} },
                },
                opts = {},
                config = function(_, opts)
                    -- setup dap config by VsCode launch.json file
                    -- require("dap.ext.vscode").load_launchjs()
                    local dap = require("dap")
                    local dapui = require("dapui")
                    dapui.setup(opts)
                    dap.listeners.after.event_initialized["dapui_config"] = function()
                      dapui.open({})
                    end
                    dap.listeners.before.event_terminated["dapui_config"] = function()
                      dapui.close({})
                    end
                    dap.listeners.before.event_exited["dapui_config"] = function()
                      dapui.close({})
                    end
                  end,
            },

            -- virtual text for the debugger
            {
                "theHamsta/nvim-dap-virtual-text",
                opts = {},
            },

            -- which key integration
            {
                "folke/which-key.nvim",
                optional = true,
                opts = {
                    defaults = {
                        ["<leader>d"] = { name = "+debug" },
                    },
                },
            },

            -- mason.nvim integration
            {
                "jay-babu/mason-nvim-dap.nvim",
                dependencies = "mason.nvim",
                cmd = { "DapInstall", "DapUninstall" },
                opts = {
                    -- Makes a best effort to setup the various debuggers with
                    -- reasonable debug configurations
                    automatic_installation = true,

                    -- You can provide additional configuration to the handlers,
                    -- see mason-nvim-dap README for more information
                    handlers = {},

                    -- You'll need to check that you have the required things installed
                    -- online, please don't ask me how to install them :)
                    ensure_installed = {
                        -- Update this to ensure that you have the debuggers for the langs you want
                    },
                },
            },
        },

        keys = {
            { "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, desc = "Breakpoint Condition" },
            { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "Toggle Breakpoint" },
            { "<leader>dc", function() require("dap").continue() end, desc = "Continue" },
            { "<leader>da", function() require("dap").continue({ before = get_args }) end, desc = "Run with Args" },
            { "<leader>dC", function() require("dap").run_to_cursor() end, desc = "Run to Cursor" },
            { "<leader>dg", function() require("dap").goto_() end, desc = "Go to Line (No Execute)" },
            { "<leader>di", function() require("dap").step_into() end, desc = "Step Into" },
            { "<leader>dj", function() require("dap").down() end, desc = "Down" },
            { "<leader>dk", function() require("dap").up() end, desc = "Up" },
            { "<leader>dl", function() require("dap").run_last() end, desc = "Run Last" },
            { "<leader>do", function() require("dap").step_out() end, desc = "Step Out" },
            { "<leader>dO", function() require("dap").step_over() end, desc = "Step Over" },
            { "<leader>dp", function() require("dap").pause() end, desc = "Pause" },
            { "<leader>dr", function() require("dap").repl.toggle() end, desc = "Toggle REPL" },
            { "<leader>ds", function() require("dap").session() end, desc = "Session" },
            { "<leader>dt", function() require("dap").terminate() end, desc = "Terminate" },
            { "<leader>dw", function() require("dap.ui.widgets").hover() end, desc = "Widgets" },
        },

        config = function()

	        local signs = {
                Stopped             = { "󰁕 ", "DiagnosticWarn", "DapStoppedLine" },
                Breakpoint          = " ",
                BreakpointCondition = " ",
                BreakpointRejected  = { " ", "DiagnosticError" },
                LogPoint            = ".>",
            }

            for name, sign in pairs(signs) do
                sign = type(sign) == "table" and sign or { sign }
                vim.fn.sign_define(
                    "Dap" .. name,
                    { text = sign[1], texthl = sign[2] or "DiagnosticInfo", linehl = sign[3], numhl = sign[3] }
                )
            end

        end
    },

    {
        "lewis6991/gitsigns.nvim",
    }

}
