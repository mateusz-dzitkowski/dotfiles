return {
        "nvim-orgmode/orgmode",
        event = "VeryLazy",
        ft = { "org" },
        dependencies = { "danilshvalov/org-modern.nvim" },
        config = function()
                local menu = require("org-modern.menu")
                local base_dir = "~/stuff/notes/"

                -- Setup orgmode
                require("orgmode").setup({
                        org_agenda_files = base_dir .. "**/*",
                        org_default_notes_file = base_dir .. "refile.org",
                        org_startup_folded = "showeverything",
                        org_todo_keywords = { "TODO(t)", "IN_PROGRESS(i)", "|", "DONE(d)" },
                        org_todo_keyword_faces = {
                                TODO = ":foreground #f38ba8 :weight bold",
                                IN_PROGRESS = ":foreground #f9e2af :weight bold",
                                DONE = ":foreground #a6e3a1 :weight bold",
                        },
                        org_log_done = false,

                        org_capture_templates = {
                                d = "Daily entry",
                                dt = {
                                        description = "Daily ticket entry",
                                        template = [=[
* TODO [[id:%^{Ticket ID}][%^{Description}]]
  SCHEDULED: <%<%Y-%m-%d>>
]=],
                                        target = base_dir .. "journal/%<%Y-%m-%d>.org",
                                },
                                dn = {
                                        description = "Daily note entry",
                                        template = [=[
* TODO %^{Description}
  SCHEDULED: <%<%Y-%m-%d>>
]=],
                                        target = base_dir .. "journal/%<%Y-%m-%d>.org",
                                },
                                t = {
                                        description = "Ticket entry",
                                        template = [[
* %^{Description}
:PROPERTIES:
:ID: %^{Ticket ID}
:END:
]],
                                        target = base_dir .. "tickets/%^{Ticket ID}.org",
                                }
                        },
                        ui = {
                                menu = {
                                        handler = function(data)
                                                menu:new():open(data)
                                        end,
                                },
                        },
                })

                local events = require("orgmode.events")
                events.listen(events.event.TodoChanged, function(event)
                        local todo = event.headline:get_todo()
                        if todo == "IN_PROGRESS" then
                                event.headline:clock_in()
                        else
                                event.headline:clock_out()
                        end
                end)

                -- Experimental LSP support
                vim.lsp.enable("org")
        end,
}
