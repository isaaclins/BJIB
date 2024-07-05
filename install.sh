#!/bin/bash

# Path to the blackjack.sh script
BLACKJACK_SCRIPT="code/blackjack.sh"

# Make blackjack.sh executable
chmod +x "$BLACKJACK_SCRIPT"
echo "Made $BLACKJACK_SCRIPT executable."

# Function to install BATS
install_bats() {
    echo "Installing BATS in the \$HOME folder..."
    git clone https://github.com/bats-core/bats-core.git "$HOME/bats"
    cd "$HOME/bats" && ./install.sh "$HOME"
    echo "BATS installed successfully."
}

# Check if BATS is installed in the $HOME folder
if [ -x "$HOME/bin/bats" ]; then
    echo "BATS is already installed."
else
    install_bats
fi

# Additional checks or installations can be added here

echo "Setup complete. You can now run blackjack.sh without any problems."