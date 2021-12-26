#!/usr/bin/with-contenv bashio
# shellcheck shell=bash
set -e

ROOT_PASSWORD=$(bashio::config 'root_password')
echo -n 'root:$ROOT_PASSWORD' | chpasswd
bashio::log.info "Setting Root PW '$ROOT_PASSWORD'"



CONFIG_FILES=$(bashio::config 'config_files')

for config in $CONFIG_FILES; do
	bashio::log.info "Apply '$config'"
	cp "$config" '/etc/asterisk/'
done

key_folders=$(bashio::config 'key_folders')

for config in $key_folders; do
        bashio::log.info "Copying all Keys from '$key_folders'"
        cp "$key_folders/*" '/etc/asterisk/keys/'
done

bashio::log.info "Seabass"
chown -R asterisk:asterisk /etc/asterisk
chmod 640 -R /etc/asterisk
