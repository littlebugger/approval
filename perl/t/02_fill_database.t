use Mojo::Base -strict;
use String::Random qw/random_regex/;
use common::sense;
use Test::More;
use Test::Mojo;
use FindBin;
use lib "$FindBin::Bin/../lib";

my $t = Test::Mojo->new('Phonebook');
my $app = $t->app;
my $db = $app->db;

use constant {
	LIMIT => 3 * (10 ** 6)
};

for ( 1 .. LIMIT ) {
	my ($name, $phone) = (random_regex( '\w{12}' ), random_regex( '\d{11}' ));
	my $last = $db->insert('phonebook', { name => $name, phone => $phone })->last_insert_id;
	print '.' unless $_ % 1000;
	last if $last == LIMIT;
}