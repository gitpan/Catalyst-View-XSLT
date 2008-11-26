use strict;
use warnings;
use Test::More tests => 5;

use FindBin;
use lib "$FindBin::Bin/../lib";
use lib "$FindBin::Bin/lib";

use_ok('Catalyst::Test', 'TestApp');

my $view = 'XML::LibXSLT';

my $response;
ok(($response = request("/testRender?view=$view&template=testRender.xsl"))->is_success, 'request ok');
is($response->content, TestApp->config->{default_message}, 'message ok');

my $message = scalar localtime;
my $xml = "<dummy-root>$message</dummy-root>";
ok(($response = request("/testRender?view=$view&message=$message&template=testRender.xsl"))->is_success, 'request with message ok');
is($response->content, $message, 'message ok');

