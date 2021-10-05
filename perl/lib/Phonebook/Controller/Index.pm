package Phonebook::Controller::Index;
use Mojo::Base 'Phonebook::Controller';

sub list($) {
	my $c = shift;
	my $DB = $c->app->db;

	my ($search_param, $page) = (
		$c->req->param('phone-search-bar'),
		$c->req->param('page')
	);

	my $list = [{id => 1, name => '123', phone => '312', created => 'lol'}, ];
	# $DB->select(
	# 	'select * from phonebook where phone like %?% limit ?',
	# 	$search_param,
	# 	$limit
	# 	$page
	# );

	return $c->render(list => $list);
}

1;
