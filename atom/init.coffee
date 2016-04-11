# Your init script
#
# Atom will evaluate this file each time a new window is opened. It is run
# after packages are loaded/activated and after the previous editor state
# has been restored.
#
# An example hack to log to the console when each text editor is saved.
#
# atom.workspace.observeTextEditors (editor) ->
#   editor.onDidSave ->
#     console.log "Saved! #{editor.getPath()}"

atom.commands.add 'atom-text-editor:not([mini])', 'line-numbers:toggle', ->
    lineNumbersShowing = atom.config.get('editor.showLineNumbers')

    if lineNumbersShowing
        atom.config.set('editor.showLineNumbers', false)
    else if not lineNumbersShowing
        atom.config.set('editor.showLineNumbers', true)
