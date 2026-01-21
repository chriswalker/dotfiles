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

# Add GCloud binaries.
set -x PATH ~/Dev/Apps/google-cloud-sdk/bin $PATH

#
# Development-specific.
#
set -x GOPRIVATE "github.com/eagle-eye-solutions/*"
