#!/bin/bash



# Ensure MariaDB is fully up and running
sleep 10
# Define WordPress directory path
WP_PATH='/var/www/html'

# Check if wp-config.php exists
if [ ! -f "$WP_PATH/wp-config.php" ]; then
    echo "wp-config.php not found, creating..."

    # Use wp-cli to create wp-config.php with environment variables
    wp config create --allow-root \
                     --dbname="${MYSQL_DATABASE}" \
                     --dbuser="${MYSQL_USER}" \
                     --dbpass="${MYSQL_PASSWORD}" \
                     --dbhost="mariadb:3306" \
                     --path="${WP_PATH}"



    echo "wp-config.php has been created."
else
    echo "wp-config.php already exists. Skipping configuration."

fi


# Wait for the database service to be ready
until wp db check --allow-root --path="/var/www/html"; do
   echo "Waiting for database..."
   sleep 5
done

# Check if WordPress is installed
if ! wp core is-installed --allow-root --path="/var/www/html"; then
    echo "Installing WordPress..."
    wp core install --url="https://localhost" --title="Stuart Wordpress" \
        --admin_user="srapop" --admin_password="12345" --admin_email="stuartrapop@gmail.com" \
        --allow-root --path="/var/www/html"

    # Create a non-admin user
    wp user create newuser test@test.com --user_pass="1234" --role=editor \
        --allow-root --path="/var/www/html"
    echo "WordPress has been installed and configured."
else
    echo "WordPress is already installed."
fi

exec php-fpm7.3 -F