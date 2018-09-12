#!/bin/bash
export PERL_MM_USE_DEFAULT=1

if [[ -d "/var/www/html/trunk2" ]]
then
cd /var/www/html/trunk2
cp perl_config/Config.pm `find /usr/ -name Config.pm|grep -v CPANPLUS|grep CPAN` -f
install CPAN::Meta::Requirements CPAN"|cpan
echo "$CPAN_TAGS Compress::Zlib Archive::Zip"|cpan 
echo "$CPAN_TAGS YAML"|cpan
echo "$CPAN_TAGS YAML::Tiny"|cpan
echo "$CPAN_TAGS inc::Module::Install"|cpan
echo "$CPAN_TAGS Net::Server::PreFork "|cpan
echo "$CPAN_TAGS Text::Template JSON  Asterisk::FastAGI CGI::Session Config::File"|cpan
echo "$CPAN_TAGS POE::Component::Client::Asterisk::Manager Net::Jabber CGI::Upload Text::CSV "|cpan
else
echo "Directory not found"
exit 1
fi