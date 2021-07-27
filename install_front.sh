#! /bin/bash
sudo apt-get update
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt-get install -y nodejs
sudo npm install npm@latest -g
git clone https://github.com/JuanFML/InterviewReactApp.git
cd InterviewReactApp
npm install
npm run start


# sudo apt-get update
# sudo apt-get install -y apache2
# sudo systemctl start apache2
# sudo systemctl enable apache2
# echo "<h1>Deployed via Terraform</h1>" | sudo tee /var/www/html/index.html