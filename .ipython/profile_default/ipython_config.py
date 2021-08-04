# Configuration file for ipython.
# https://ipython.readthedocs.io/en/stable/config/options/terminal.html

#------------------------------------------------------------------------------
# InteractiveShell(SingletonConfigurable) configuration
#------------------------------------------------------------------------------

## An enhanced, interactive shell for Python.

## 'all', 'last', 'last_expr' or 'none', 'last_expr_or_assign' specifying which
#  nodes should be run interactively (displaying output from expressions).
#c.InteractiveShell.ast_node_interactivity = 'last_expr'

## A list of ast.NodeTransformer subclass instances, which will be applied to
#  user input before code is run.
#c.InteractiveShell.ast_transformers = []

## Automatically run await statement in the top level repl.
#c.InteractiveShell.autoawait = True

## Make IPython automatically call any callable object even if you didn't type
#  explicit parentheses. For example, 'str 43' becomes 'str(43)' automatically.
#  The value can be '0' to disable the feature, '1' for 'smart' autocall, where
#  it is not applied if there are no more arguments on the line, and '2' for
#  'full' autocall, where all callable objects are automatically called (even if
#  no arguments are present).
#c.InteractiveShell.autocall = 0

## Autoindent IPython code entered interactively.
#c.InteractiveShell.autoindent = True

## Enable magic commands to be called without the leading %.
#c.InteractiveShell.automagic = True

## The part of the banner to be printed before the profile
#c.InteractiveShell.banner1 = "Python 3.5.3 (default, Sep 27 2018, 17:25:39) \nType 'copyright', 'credits' or 'license' for more information\nIPython 7.5.0 -- An enhanced Interactive Python. Type '?' for help.\n"

## The part of the banner to be printed after the profile
#c.InteractiveShell.banner2 = ''

## Set the size of the output cache.  The default is 1000, you can change it
#  permanently in your config file.  Setting it to 0 completely disables the
#  caching system, and the minimum value accepted is 3 (if you provide a value
#  less than 3, it is reset to 0 and a warning is issued).  This limit is defined
#  because otherwise you'll spend more time re-flushing a too small cache than
#  working
#c.InteractiveShell.cache_size = 1000

## Use colors for displaying information about objects. Because this information
#  is passed through a pager (like 'less'), and some pagers get confused with
#  color codes, this capability can be turned off.
#c.InteractiveShell.color_info = True

## Set the color scheme (NoColor, Neutral, Linux, or LightBG).
c.InteractiveShell.colors = 'Linux'

##
#c.InteractiveShell.debug = False

## Don't call post-execute functions that have failed in the past.
#c.InteractiveShell.disable_failing_post_execute = False

## If True, anything that would be passed to the pager will be displayed as
#  regular output instead.
#c.InteractiveShell.display_page = False

## (Provisional API) enables html representation in mime bundles sent to pagers.
#c.InteractiveShell.enable_html_pager = False

## Total length of command history
#c.InteractiveShell.history_length = 10000

## The number of saved history entries to be loaded into the history buffer at
#  startup.
#c.InteractiveShell.history_load_length = 1000

##
#c.InteractiveShell.ipython_dir = ''

## Start logging to the given file in append mode. Use `logfile` to specify a log
#  file to **overwrite** logs to.
#c.InteractiveShell.logappend = ''

## The name of the logfile to use.
#c.InteractiveShell.logfile = ''

## Start logging to the default log file in overwrite mode. Use `logappend` to
#  specify a log file to **append** logs to.
#c.InteractiveShell.logstart = False

## Select the loop runner that will be used to execute top-level asynchronous
#  code
#c.InteractiveShell.loop_runner = 'IPython.core.interactiveshell._asyncio_runner'

##
#c.InteractiveShell.object_info_string_level = 0

## Automatically call the pdb debugger after every exception.
#c.InteractiveShell.pdb = False

## Show rewritten input, e.g. for autocall.
#c.InteractiveShell.show_rewritten_input = True

## Enables rich html representation of docstrings. (This requires the docrepr
#  module).
#c.InteractiveShell.sphinxify_docstring = False

##
#c.InteractiveShell.wildcards_case_sensitive = True

## Switch modes for the IPython exception handlers.
#c.InteractiveShell.xmode = 'Context'

#------------------------------------------------------------------------------
# TerminalInteractiveShell(InteractiveShell) configuration
#------------------------------------------------------------------------------

## Set to confirm when you try to exit IPython with an EOF (Control-D in Unix,
#  Control-Z/Enter in Windows). By typing 'exit' or 'quit', you can force a
#  direct exit without any confirmation.
#c.TerminalInteractiveShell.confirm_exit = True

## Options for displaying tab completions, 'column', 'multicolumn', and
#  'readlinelike'. These options are for `prompt_toolkit`, see `prompt_toolkit`
#  documentation for more information.
#c.TerminalInteractiveShell.display_completions = 'multicolumn'

## Shortcut style to use at the prompt. 'vi' or 'emacs'.
#c.TerminalInteractiveShell.editing_mode = 'emacs'

## Set the editor used by IPython (default to $EDITOR/vi/notepad).
c.TerminalInteractiveShell.editor = 'vi'

## Allows to enable/disable the prompt toolkit history search
#c.TerminalInteractiveShell.enable_history_search = True

## Enable vi (v) or Emacs (C-X C-E) shortcuts to open an external editor. This is
#  in addition to the F2 binding, which is always enabled.
c.TerminalInteractiveShell.extra_open_editor_shortcuts = True

## Provide an alternative handler to be called when the user presses Return. This
#  is an advanced option intended for debugging, which may be changed or removed
#  in later releases.
#c.TerminalInteractiveShell.handle_return = None

## Highlight matching brackets.
#c.TerminalInteractiveShell.highlight_matching_brackets = True

## The name or class of a Pygments style to use for syntax highlighting. To see
#  available styles, run `pygmentize -L styles`.
#c.TerminalInteractiveShell.highlighting_style = traitlets.Undefined

## Override highlighting format for specific tokens
#c.TerminalInteractiveShell.highlighting_style_overrides = {}

## Enable mouse support in the prompt (Note: prevents selecting text with the
#  mouse)
#c.TerminalInteractiveShell.mouse_support = False

## Display the current vi mode (when using vi editing mode).
#c.TerminalInteractiveShell.prompt_includes_vi_mode = True

## Class used to generate Prompt token for prompt_toolkit
#c.TerminalInteractiveShell.prompts_class = 'IPython.terminal.prompts.Prompts'

## Use `raw_input` for the REPL, without completion and prompt colors.
#
#  Useful when controlling IPython as a subprocess, and piping STDIN/OUT/ERR.
#  Known usage are: IPython own testing machinery, and emacs inferior-shell
#  integration through elpy.
#
#  This mode default to `True` if the `IPY_TEST_SIMPLE_PROMPT` environment
#  variable is set, or the current terminal is not a tty.
#c.TerminalInteractiveShell.simple_prompt = False

## Number of line at the bottom of the screen to reserve for the completion menu
#c.TerminalInteractiveShell.space_for_menu = 6

## Automatically set the terminal title
#c.TerminalInteractiveShell.term_title = True

## Customize the terminal title format.  This is a python format string.
#  Available substitutions are: {cwd}.
#c.TerminalInteractiveShell.term_title_format = 'IPython: {cwd}'

## Use 24bit colors instead of 256 colors in prompt highlighting. If your
#  terminal supports true color, the following command should print 'TRUECOLOR'
#  in orange: printf "\x1b[38;2;255;100;0mTRUECOLOR\x1b[0m\n"
#c.TerminalInteractiveShell.true_color = False

#------------------------------------------------------------------------------
# HistoryAccessor(HistoryAccessorBase) configuration
#------------------------------------------------------------------------------

## Access the history database without adding to it.
#
#  This is intended for use by standalone history tools. IPython shells use
#  HistoryManager, below, which is a subclass of this.

## Options for configuring the SQLite connection
#
#  These options are passed as keyword args to sqlite3.connect when establishing
#  database connections.
#c.HistoryAccessor.connection_options = {}

## enable the SQLite history
#
#  set enabled=False to disable the SQLite history, in which case there will be
#  no stored history, no SQLite connection, and no background saving thread.
#  This may be necessary in some threaded environments where IPython is embedded.
#c.HistoryAccessor.enabled = True

## Path to file to use for SQLite history database.
#
#  By default, IPython will put the history database in the IPython profile
#  directory.  If you would rather share one history among profiles, you can set
#  this value in each, so that they are consistent.
#
#  Due to an issue with fcntl, SQLite is known to misbehave on some NFS mounts.
#  If you see IPython hanging, try setting this to something on a local disk,
#  e.g::
#
#      ipython --HistoryManager.hist_file=/tmp/ipython_hist.sqlite
#
#  you can also use the specific value `:memory:` (including the colon at both
#  end but not the back ticks), to avoid creating an history file.
#c.HistoryAccessor.hist_file = ''

#------------------------------------------------------------------------------
# HistoryManager(HistoryAccessor) configuration
#------------------------------------------------------------------------------

## A class to organize all history-related functionality in one place.

## Write to database every x commands (higher values save disk access & power).
#  Values of 1 or less effectively disable caching.
#c.HistoryManager.db_cache_size = 0

## Should the history database include output? (default: no)
#c.HistoryManager.db_log_output = False

#------------------------------------------------------------------------------
# ProfileDir(LoggingConfigurable) configuration
#------------------------------------------------------------------------------

## An object to manage the profile directory and its resources.
#
#  The profile directory is used by all IPython applications, to manage
#  configuration, logging and security.
#
#  This object knows how to find, create and manage these directories. This
#  should be used by any code that wants to handle profiles.

## Set the profile location directly. This overrides the logic used by the
#  `profile` option.
#c.ProfileDir.location = ''

#------------------------------------------------------------------------------
# BaseFormatter(Configurable) configuration
#------------------------------------------------------------------------------

## A base formatter class that is configurable.
#
#  This formatter should usually be used as the base class of all formatters. It
#  is a traited :class:`Configurable` class and includes an extensible API for
#  users to determine how their objects are formatted. The following logic is
#  used to find a function to format an given object.
#
#  1. The object is introspected to see if it has a method with the name
#     :attr:`print_method`. If is does, that object is passed to that method
#     for formatting.
#  2. If no print method is found, three internal dictionaries are consulted
#     to find print method: :attr:`singleton_printers`, :attr:`type_printers`
#     and :attr:`deferred_printers`.
#
#  Users should use these dictionaries to register functions that will be used to
#  compute the format data for their objects (if those objects don't have the
#  special print methods). The easiest way of using these dictionaries is through
#  the :meth:`for_type` and :meth:`for_type_by_name` methods.
#
#  If no function/callable is found to compute the format data, ``None`` is
#  returned and this format type is not used.

#c.BaseFormatter.deferred_printers = {}
#c.BaseFormatter.enabled = True
#c.BaseFormatter.singleton_printers = {}
#c.BaseFormatter.type_printers = {}

#------------------------------------------------------------------------------
# PlainTextFormatter(BaseFormatter) configuration
#------------------------------------------------------------------------------

## The default pretty-printer.
#
#  This uses :mod:`IPython.lib.pretty` to compute the format data of the object.
#  If the object cannot be pretty printed, :func:`repr` is used. See the
#  documentation of :mod:`IPython.lib.pretty` for details on how to write pretty
#  printers.  Here is a simple example::
#
#      def dtype_pprinter(obj, p, cycle):
#          if cycle:
#              return p.text('dtype(...)')
#          if hasattr(obj, 'fields'):
#              if obj.fields is None:
#                  p.text(repr(obj))
#              else:
#                  p.begin_group(7, 'dtype([')
#                  for i, field in enumerate(obj.descr):
#                      if i > 0:
#                          p.text(',')
#                          p.breakable()
#                      p.pretty(field)
#                  p.end_group(7, '])')

## Truncate large collections (lists, dicts, tuples, sets) to this size.
#
#  Set to 0 to disable truncation.
c.PlainTextFormatter.max_seq_length = 100
# c.PlainTextFormatter.float_precision = '%f'
