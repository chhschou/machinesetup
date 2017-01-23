#!/usr/bin/env bash

# Full path of this script, will work with symlink
THIS="$(python -c "import os; print(os.path.realpath('$0'))")"

# script root
ROOT_DIR=`dirname $(dirname $(dirname "$THIS"))`

echo $ROOT_DIR
# 'Dot' means 'source', i.e. 'include'
. "$ROOT_DIR/mac/link_util_incl.sh"


rmsymlink "$HOME/.vimrc"
createsymlink "$HOME/machinesetup/vim/.vimrc" "$HOME/.vimrc

