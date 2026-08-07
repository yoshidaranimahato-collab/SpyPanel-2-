#!/bin/bash
set -e

clear
echo "========================================"
echo "             SPYPANEL INSTALLER"
echo "========================================"
echo ""
echo "1. Install Panel"
echo "2. Uninstall Panel"
echo "3. Create Node"
echo "4. Soon"
echo "5. Exit"
echo ""

read -r -p "Choose an option [1-5]: " option

REPO="https://github.com/yoshidaranimahato-collab/SpyPanel.git"
DIR="SpyPanel"

case "$option" in
  1)
    command -v git >/dev/null 2>&1 || { echo "Git is required."; exit 1; }
    command -v node >/dev/null 2>&1 || { echo "Node.js is required."; exit 1; }

    if [ ! -d "$DIR" ]; then
      echo "Downloading SpyPanel..."
      git clone "$REPO" "$DIR"
    else
      echo "Updating SpyPanel..."
      git -C "$DIR" pull --ff-only
    fi

    cd "$DIR"
    npm install
    echo ""
    echo "SpyPanel starting on port 6767..."
    exec node server.js
    ;;
  2)
    echo "For safety this option does not delete arbitrary system files."
    echo "Remove the SpyPanel project directory manually if needed."
    ;;
  3)
    echo "Create Node: Coming Soon!"
    ;;
  4)
    echo "Coming Soon!"
    ;;
  5)
    exit 0
    ;;
  *)
    echo "Invalid option."
    exit 1
    ;;
esac
