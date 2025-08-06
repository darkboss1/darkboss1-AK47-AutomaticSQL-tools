#!/bin/bash

clear
echo -e "\e[1;31m"
echo " 
  ______     _______   _______   ___ ___    _______    _______   _______   _______   _____  
 |   _  \   |   _   | |   _   \ |   Y   )  |   _   \  |   _   | |   _   | |   _   | | _   |
 |.  |   \  |.  1   | |.  l   / |.  1  /   |.  1   /  |.  |   | |   1___| |   1___| |.|   |
 |.  |    \ |.  _   | |.  _   1 |.  _  \   |.  _   \  |.  |   | |____   | |____   | `-|.  |
 |:  1    / |:  |   | |:  |   | |:  |   \  |:  1    \ |:  1   | |:  1   | |:  1   |   |:  |
 |::.. . /  |::.|:. | |::.|:. | |::.| .  ) |::.. .  / |::.. . | |::.. . | |::.. . |   |::.|
 `------'   `--- ---' `--- ---' `--- ---'  `-------'  `-------' `-------' `-------'   `---'
                                        "
echo "                                            
echo "                                            
echo -e "\e[1;32m        darkboss1 Squad - Auto Installer"
echo -e "\e[0m"

# Check and update packages
echo "[*] Updating packages..."
pkg update -y && pkg upgrade -y

# Install required packages
echo "[*] Installing dependencies..."
pkg install -y python git curl wget unzip

# Install pip packages
echo "[*] Installing Python modules..."
pip install --upgrade pip
pip install termcolor

# Clone sqlmap if not present
if [ ! -d "sqlmap" ]; then
    echo "[*] Cloning SQLMap..."
    git clone --depth 1 https://github.com/darkboss1/darkboss1-AK47-AutomaticSQL-tools.git
fi

# Install ParamSpider
if ! command -v paramspider &> /dev/null; then
    echo "[*] Installing ParamSpider..."
    pip install git+https://github.com/devanshbatham/paramspider.git
fi

# Create output directory
mkdir -p output

echo -e "\n\e[1;32m[✔] All done! Run the tool using:\e[0m"
echo -e "\e[1;33mpython3 darkboss1-AK47-AutomaticSQL-tools.py <url>\e[0m"
