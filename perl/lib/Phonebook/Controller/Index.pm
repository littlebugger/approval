package Phonebook::Controller::Index;
use Mojo::Base 'Phonebook::Controller';

<<<<<<< Updated upstream
=======
use constant {
	TABLE => 'phonebook',
	SQL_LIMIT => 100,
};

>>>>>>> Stashed changes
sub list($) {
	my $c = shift;
	my $DB = $c->app->db;

<<<<<<< Updated upstream
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
=======
	my $params = $c->req->params->to_hash;

	my ($where, $page) = $c->_parse_phonebook_params($params);
	my $limits = $c->_limit_offset_by_page($page);

	my $list = $DB->select(TABLE, '*', $where, $limits)->hashes;
	return $c->render(
		list => $list,
		page => $page,
	);
}

sub _parse_phonebook_params ($$) {
	my ($self, $params) = @_;

	my $where = ($params->{phone_search} =~ /\d+/) ? { phone => { like => '%' . $params->{phone_search} . '%' } } : undef;
	my $page = ($params->{page} =~ /\d+/) ? $params->{page} : 1;

	return ($where, $page);
}

sub _limit_offset_by_page($$) {
	my ($self, $page) = @_;

	return { limit => SQL_LIMIT, offset => SQL_LIMIT * ( $page - 1 ) };
}

1;


=encoding utf8

=head1 NAME

Phonebook::Controller::Index - постраничный вывод адресной книги.

=head2 Проблемы:

like c ведущим % - плохо влияет на index - лучше рассмотреть возможность избавится от него в этом месте.

=head2 Использование:

    GET /?phone_search=***&page=***
>>>>>>> Stashed changes
