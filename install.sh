#!/bin/bash

set -e

REPO="https://github.com/yoshidaranimahato-collab/SpyPanel-2.git"
PANEL_DIR="$HOME/SpyPanel-2"

show_menu() {
    clear

    echo "╔══════════════════════════════════════╗"
    echo "║              SPY PANEL               ║"
    echo "╚══════════════════════════════════════╝"
    echo ""
    echo "1. INSTALL PANEL"
    echo "2. INSTALL NODE"
    echo "3. UNINSTALL PANEL"
    echo "4. UNINSTALL NODE"
    echo "5. EXIT"
    echo ""
}

install_panel() {
    echo ""
    echo "========================================"
    echo "        INSTALLING SPY PANEL"
    echo "========================================"

    if ! command -v git >/dev/null 2>&1; then
        echo "Git is required."
        echo "Please install Git first."
        return
    fi

    if ! command -v node >/dev/null 2>&1; then
        echo ""
        echo "Node.js is not installed."
        echo "Please select option 2 first."
        return
    fi

    if [ -d "$PANEL_DIR" ]; then
        echo "SpyPanel already exists."
        echo "Updating panel..."
        git -C "$PANEL_DIR" pull --ff-only
    else
        echo "Downloading SpyPanel..."
        git clone "$REPO" "$PANEL_DIR"
    fi

    cd "$PANEL_DIR"

    echo ""
    echo "Installing panel dependencies..."
    npm install

    echo ""
    echo "========================================"
    echo "       SPY PANEL INSTALLED"
    echo "========================================"
    echo ""
    echo "Panel port: 6767"
    echo ""

    read -r -p "Press Enter to start the panel..."
    node server.js
}

install_node() {
    echo ""
    echo "========================================"
    echo "          INSTALLING NODE.JS"
    echo "========================================"
    echo ""

    if command -v node >/dev/null 2>&1; then
        echo "Node.js is already installed."
        node --version
        npm --version
        return
    fi

    if command -v apt-get >/dev/null 2>&1; then
        echo "Installing Node.js using NodeSource..."

        curl -fsSL https://deb.nodesource.com/setup_22.x | bash -
        apt-get install -y nodejs

    elif command -v pkg >/dev/null 2>&1; then
        echo "Termux detected."
        pkg update -y
        pkg install nodejs -y

    elif command -v brew >/dev/null 2>&1; then
        echo "Installing Node.js using Homebrew..."
        brew install node

    else
        echo "Automatic Node.js installation is not supported"
        echo "on this system."
        return
    fi

    echo ""
    echo "Node.js installation completed."
    echo "Node: $(node --version)"
    echo "NPM:  $(npm --version)"
}

uninstall_panel() {
    echo ""
    echo "========================================"
    echo "        UNINSTALLING SPY PANEL"
    echo "========================================"
    echo ""

    if [ -d "$PANEL_DIR" ]; then
        rm -rf "$PANEL_DIR"
        echo "SpyPanel removed."
    else
        echo "SpyPanel is not installed."
    fi
}

uninstall_node() {
    echo ""
    echo "========================================"
    echo "          UNINSTALLING NODE.JS"
    echo "========================================"
    echo ""

    if command -v apt-get >/dev/null 2>&1; then
        apt-get remove -y nodejs npm || true
        apt-get autoremove -y || true
        echo "Node.js removed."

    elif command -v pkg >/dev/null 2>&1; then
        pkg uninstall nodejs -y || true
        echo "Node.js removed."

    elif command -v brew >/dev/null 2>&1; then
        brew uninstall node || true
        echo "Node.js removed."

    else
        echo "Automatic Node.js removal is not supported"
        echo "on this system."
    fi
}

while true; do

    show_menu

    read -r -p "Choose an option [1-5]: " option

    case "$option" in
        1)
            install_panel
            ;;
        2)
            install_node
            ;;
        3)
            uninstall_panel
            ;;
        4)
            uninstall_node
            ;;
        5)
            echo ""
            echo "Thanks for using SpyPanel!"
            exit 0
            ;;
        *)
            echo ""
            echo "Invalid option."
            ;;
    esac

    echo ""
    read -r -p "Press Enter to return to menu..."

done
