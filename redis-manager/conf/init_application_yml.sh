#!/bin/bash
echo "run init_application_yml.sh"

if [ ! -f "application.yml" ]; then
    echo "application.yml not exist"
    cp application.yml.tpl application.yml
    sed -i "s/<SERVER_PORT>/$SERVER_PORT}/" application.yml
    sed -i "s/<DATASOURCE_DATABASE>/$DATASOURCE_DATABASE}/" application.yml
    sed -i "s/<DATASOURCE_URL>/$DATASOURCE_URL}/" application.yml
    sed -i "s/<DATASOURCE_USERNAME>/$DATASOURCE_USERNAME}/" application.yml
    sed -i "s/<DATASOURCE_PASSWORD>/$DATASOURCE_PASSWORD}/" application.yml
    sed -i "s/<RM_AUTH_USERNAME>/$RM_AUTH_USERNAME}/" application.yml
    sed -i "s/<RM_AUTH_PASSWORD>/$RM_AUTH_PASSWORD}/" application.yml
    sed -i "s/<RM_AUTH_COMPANY_NAME>/$RM_AUTH_COMPANY_NAME}/" application.yml
    sed -i "s/<RM_AUTH_SERVER>/$RM_AUTH_SERVER}/" application.yml
    sed -i "s/<RM_AUTH_SITE_KEY>/$RM_AUTH_SITE_KEY}/" application.yml
    sed -i "s/<RM_AUTH_SITE_SECRET>/$RM_AUTH_SITE_SECRET}/" application.yml
    sed -i "s/<CURRENT_HOST>/$CURRENT_HOST}/" application.yml
fi