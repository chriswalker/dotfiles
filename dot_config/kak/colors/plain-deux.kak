# A variant of the Kakoune 'plain' theme, with a little more
# colour. Like 'plain', it takes its underlying colours from
# the terminal colour settings.

# For default
face global value magenta
face global type default
face global identifier default
face global string green
face global keyword default
face global operator default
face global attribute default
face global comment bright-black
face global documentation comment
face global meta default
face global builtin default


# For default
face global title default
face global header cyan
face global mono yellow
face global block default
face global link blue
face global bullet magenta
face global list default

# builtin default
face global Default default,default
face global PrimarySelection black,blue
face global SecondarySelection black,cyan+b
face global PrimaryCursor black,white
face global SecondaryCursor white,blue
face global PrimaryCursorEol white,bright-yellow
face global SecondaryCursorEol default
face global LineNumbers bright-black+b
face global LineNumberCursor yellow+b
face global MenuForeground black,bright-white+b
face global MenuBackground bright-white,black+b
face global MenuInfo default
face global Information bright-white,black
face global Error red
face global DiagnosticError red
face global DiagnosticWarning yellow
face global StatusLine yellow,black+b
face global StatusLineMode black,green+b
face global StatusLineInfo green+b
face global StatusLineValue red
face global StatusCursor default+r
face global Prompt default
face global MatchingChar default
face global BufferPadding bright-black
