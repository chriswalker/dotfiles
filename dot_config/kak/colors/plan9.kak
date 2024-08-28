#
# acme.kak, by chriswalker
#
# Based on `vacme` (https://github.com/overvale/vacme), a Vim
# theme implementing Acme editor colours, with some tweaks (vacme
# also uses 256-colours, in addition to truecolour).
#

# TODO - 
evaluate-commands %sh{
    white1='rgb:FFFFEC'
    white2='rgb:FFFFC7'
    white3='rgb:EEEEA7'
    white4='rgb:999957'
    # white2='rgb:EEEEA7'
    # white3='rgb:999957'
    # white4='rgb:424242'

    red1='rgb:F8E7E7'
    red2='rgb:F2ACAA'
    red3='rgb:B85C57'

    green1='rgb:EFFEEC'
    green2='rgb:98CE8F'
    green3='rgb:57864E'

    yellow1='rgb:EAEBDB'
    yellow2='rgb:B7B19C'
    yellow3='rgb:8F7634'

    blue1='rgb:E2F1F8'
    blue2='rgb:A6DCF8'
    blue3='rgb:2A8DC5'

    magenta2='rgb:D0D0F7'
    magenta3='rgb:8888C7'

    cyan1='rgb:CCFFFE'
    cyan2='rgb:B0ECED'
    cyan3='rgb:6AA7A8'

    accent1='rgb:030093'

    black='rgb:000000'
    white='rgb:ffffff'

    # Code
    echo "
        face global value ${black}
        face global type ${black}
        face global variable ${black}
        face global module ${black}
        face global function ${black}
        face global string ${black}
        face global keyword ${black}
        face global operator ${black}
        face global attribute ${black}
        face global comment ${black}
        face global meta ${black}
        face global builtin ${black}
    "

    # Markup - TODO
    echo "
       face global title ${black}
       face global header ${black}
       face global bold ${black}
       face global italic ${black}
       face global mono ${black}
       face global block ${black}
       face global link ${black}
       face global bullet ${black}
       face global list ${black}
    "

    # Builtins
    echo "
        face global Default ${black},${white1}
        face global PrimarySelection ${black},${white3}
        face global SecondarySelection ${black},${cyan2}
        face global PrimaryCursor ${black},${cyan2}
        face global SecondaryCursor ${black},${white3}
        face global PrimaryCursorEol ${white1},${red2}
        face global SecondaryCursorEol ${magenta3}
        face global LineNumbers ${black},${white1}
        face global LineNumberCursor ${black},${white3}
        face global MenuForeground ${black},${blue2}+b
        face global MenuBackground ${black},${blue1}
        face global MenuInfo ${black},${blue1}
        face global Information ${black},${blue1}
        face global Error ${red3}+b
        face global DiagnosticError ${red3}+b
        face global DiagnosticWarning ${red3}+b
        face global StatusLine ${black},${blue1}
        face global StatusLineMode ${black},${blue1}+b
        face global StatusLineInfo ${black},${blue1}+b
        face global StatusLineValue ${red1}
        face global StatusCursor ${black}+r
        face global Prompt ${black}
        face global MatchingChar ${black},${white3}
        face global BufferPadding ${black}
    "

    # Custom
    echo "
    	face global Ruler ${black},${white2}
    	face global Todo ${black},${blue1}
	"
}
