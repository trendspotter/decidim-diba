#!/bin/sh
envsubst < /etc/nginx/sites-enabled/decidim-diba.conf > /etc/nginx/sites-enabled/decidim-diba-overriden.conf
mv /etc/nginx/sites-enabled/decidim-diba-overriden.conf /etc/nginx/sites-enabled/decidim-diba.conf