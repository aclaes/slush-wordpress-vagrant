echo -e "\033[33;35m ************************************************ \033[0m"
echo -e "\033[33;35m ***           PREPARE INSTALLATION           *** \033[0m"
echo -e "\033[33;35m ************************************************ \033[0m"

echo -e "\n\n\033[33;35m ************ Update packages ************ \033[0m"
sudo apt-get update
sudo apt-get upgrade

echo -e "\n\n\033[33;35m ************ Prepare MySQL Sercer ************ \033[0m"
# Prefill answered questions for root user upon mysql installation
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password password root"
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password_again password root"

echo -e "\n\n\033[33;35m ************ Add PHP 7 PPAs ************ \033[0m"
sudo add-apt-repository ppa:ondrej/php


echo -e "\033[33;35m ************************************************ \033[0m"
echo -e "\033[33;35m ***           INSTALL DEPENDENCIES           *** \033[0m"
echo -e "\033[33;35m ************************************************ \033[0m"

echo -e "\n\n\033[33;35m ************ Install Apache ************ \033[0m"
sudo apt-get install -y  apache2

echo -e "\n\n\033[33;35m ************ Install MySQL Server ************ \033[0m"
sudo apt-get install -y mysql-server

echo -e "\n\n\033[33;35m ************ Install PHP 7 ************ \033[0m"
sudo apt-get install -y php7.0-common php7.0-dev php7.0-json php7.0-opcache php7.0-cli libapache2-mod-php7.0 php7.0 php7.0-mysql php7.0-fpm php7.0-curl php7.0-gd php7.0-mcrypt php7.0-mbstring php7.0-bcmath php7.0-zip


echo -e "\033[33;35m ************************************************ \033[0m"
echo -e "\033[33;35m ***              CONFIGURATION               *** \033[0m"
echo -e "\033[33;35m ************************************************ \033[0m"

echo -e "\n\n\033[33;35m ************ Create Apache VirtualHost ************ \033[0m"
# Link project directory to /var/www
sudo ln -fs /vagrant/wordpress/ /var/www/wordpress

# Add a new virtual host configuration file
sudo ln -sf /vagrant/config/apache2/default.conf /etc/apache2/sites-available/default.conf

# Enable new virtual host
sudo a2ensite default.conf

# Disable default virtual host (important!)
sudo a2dissite 000-default.conf

echo -e "\n\n\033[33;35m ************ Configure Apache ************ \033[0m"
sudo a2enmod rewrite

echo -e "\n\n\033[33;35m ************ Restart Apache ************ \033[0m"
sudo service apache2 restart

echo -e "\n\n\033[33;35m ************ Configure MySQL ************ \033[0m"
# Create database for wordpress
mysql -uroot -proot -e "CREATE DATABASE wordpress" > /dev/null
# Add new user
mysql -uroot -proot -e "CREATE USER 'wordpress'@'localhost' IDENTIFIED BY 'wordpress';" > /dev/null
# Grant privileges for new user
mysql -uroot -proot -e "GRANT ALL PRIVILEGES ON *.* TO 'wordpress'@'localhost'; FLUSH PRIVILEGES;" > /dev/null

echo -e "\n\n\033[33;35m ************ Configure PHP 7 ************ \033[0m"
# Show all PHP errors for debugging
sed -i "s/error_reporting = .*/error_reporting = E_ALL/" /etc/php/7.0/apache2/php.ini
sed -i "s/display_errors = .*/display_errors = On/" /etc/php/7.0/apache2/php.ini

echo -e "\n\n\033[33;35m ************ Download & Configure Wordpress ************ \033[0m"
# Download and untar Wordpress
sudo rm -rf /vagrant/wordpress
sudo wget --progress=bar:force -O /vagrant/wordess-latest.tar.gz http://wordpress.org/latest.tar.gz
sudo tar xzvf /vagrant/wordess-latest.tar.gz -C /vagrant
sudo rm /vagrant/wordess-latest.tar.gz

# Add .htaccess file
sudo ln -fs /vagrant/config/wordpress/.htaccess /vagrant/wordpress/.htaccess

# Add wp-config.php file
sudo ln -fs /vagrant/config/wordpress/wp-config.php /vagrant/wordpress/wp-config.php

# Copy custom theme to dist directory and link to wordpress directory
sudo rm -rf /vagrant/dist/
sudo mkdir -p /vagrant/dist/wp-content/themes/
sudo cp -R /vagrant/src/php/wp-content/themes/<%= appNameSlug %> /vagrant/dist/wp-content/themes/<%= appNameSlug %>
sudo ln -fs /vagrant/dist/wp-content/themes/<%= appNameSlug %> /vagrant/wordpress/wp-content/themes/<%= appNameSlug %>

# Download Wordpress CLI
sudo wget --progress=bar:force -O /usr/bin/wp https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
sudo chmod +x /usr/bin/wp

# Install the Wordpress site
wp core install --url=<%= appDomain %> --title="<%= appName %>" --admin_user=admin --admin_password=admin --admin_email=admin@<%= appDomain %> --path=/vagrant/wordpress --allow-root

# Activate custom theme
wp theme activate <%= appNameSlug %> --path=/vagrant/wordpress --allow-root

# Delete unused themes
wp theme delete twentyfifteen --path=/vagrant/wordpress --allow-root
wp theme delete twentyseventeen --path=/vagrant/wordpress --allow-root
wp theme delete twentysixteen --path=/vagrant/wordpress --allow-root

echo -e "\033[33;35m ************************************************ \033[0m"
echo -e "\033[33;35m ***                  READY                   *** \033[0m"
echo -e "\033[33;35m ************************************************ \033[0m"

echo -e "Visit: http://<%= appDomain %>"
