#
# work.fish - work-related fish configuration
#
# Usually $PATH additions, some work-specific env
# vars (where non-sensitive) and so on.
#
# @author Chris Walker
#

#
# $PATH-related additions.
#
# Nothing to see here, move along...

#
# Development-specific.
#
set -x GOPRIVATE "github.com/eagle-eye-solutions/*"

#
# Abbreviations.
#
abbr --add k "kubectl"
abbr --add kgp "kubectl get pods"
abbr --add kdp "kubectl describe pod"

abbr --add d "docker"
abbr --add dil "docker image ls"
abbr --add dcl "docker container ls"
abbr --add dcu "docker compose up"
abbr --add dcd "docker compose down"

