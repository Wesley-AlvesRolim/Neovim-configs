local config = {
    cmd = {vim.fs.normalize('~/.local/share/nvim/jdt-language-server/bin/jdtls')},
    root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw'}, { upward = true })[1])
}

require('jdtls').start_or_attach(config)

