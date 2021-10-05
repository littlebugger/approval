use Mojo::Base -strict;
use Test::More;
use Test::Mojo;
use FindBin;
use lib "$FindBin::Bin/../lib";

my $t = Test::Mojo->new('Phonebook');
$t->get_ok('/')->status_is(200)->content_like(qr/Phonebook/i);

done_testing();
