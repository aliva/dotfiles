atom.commands.add 'atom-text-editor:not([mini])', 'line-numbers:toggle', ->
  lineNumbersShowing = atom.config.get('editor.showLineNumbers')

  if lineNumbersShowing
    atom.config.set('editor.showLineNumbers', false)
  else if not lineNumbersShowing
    atom.config.set('editor.showLineNumbers', true)
