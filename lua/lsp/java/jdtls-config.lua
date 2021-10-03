local M = {}

function M.setup()

    -- key binding
    require('lsp.java.jdtls-binding')

    local root_markers = {'gradlew', 'pom.xml', 'project.root'}
    local root_dir = require('jdtls.setup').find_root(root_markers)

    local home = os.getenv('HOME')

    local workspace_folder = home .. "/lsp-cache/.workspace" .. vim.fn.fnamemodify(root_dir, ":p:h:t")

    local config = {
        filetypes = {'java'};
    }
    -- edit with your own exectuable file, can just simply copy to /usr/bin with no .sh suffix
    config.cmd = {'jdtls-launch', workspace_folder}

    require('jdtls').start_or_attach(config)
    local finders = require'telescope.finders'
    local sorters = require'telescope.sorters'
    local actions = require'telescope.actions'
    local pickers = require'telescope.pickers'
    require('jdtls.ui').pick_one_async = function(items, prompt, label_fn, cb)
      local opts = {}
      pickers.new(opts, {
        prompt_title = prompt,
        finder    = finders.new_table {
          results = items,
          entry_maker = function(entry)
            return {
              value = entry,
              display = label_fn(entry),
              ordinal = label_fn(entry),
            }
          end,
        },
        sorter = sorters.get_generic_fuzzy_sorter(),
        attach_mappings = function(prompt_bufnr)
          actions.select_default:replace(function()
            local selection = actions.get_selected_entry(prompt_bufnr)
            actions.close(prompt_bufnr)

            cb(selection.value)
          end)

          return true
        end,
      }):find()
    end

end

return M
