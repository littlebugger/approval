package Phonebook;
use Mojo::Base 'Mojolicious';
use Mojo::Home;

our $VERSION = '0.1.x';
my $CLASS = __PACKAGE__;

has conf => sub { shift->plugin('Config' => {file => 'config/phonebook.conf'}) };

sub startup($) {
	my $app = shift;
	$ENV{MOJO_HOME} ||= Mojo::Home->new->detect;
	$app->log(Mojo::Log->new(%{$app->conf->{log}})) if $app->conf->{log};
	$app->log->debug("Starting $CLASS $VERSION");
	$app->controller_class('Phonebook::Controller');
	$app->attr(db => sub {
			use Mojo::mysql;
			return Mojo::mysql->strict_mode($app->conf->{mysql});
		}
	);

	$app->_set_routes_attrs->_public_routes;

	$app->sessions->cookie_name($app->conf->{cookie}->{name});
	$app->secrets($app->conf->{secrets});
}

sub _set_routes_attrs($) {
	my $app = shift;
	my $r = $app->routes;
	push @{$r->base_classes}, $app->controller_class;
	$r->namespaces($r->base_classes);
	push @{$app->renderer->paths}, '/app/templates';
	return $app;
}

sub _public_routes($) {
	my $app = shift;
	my $routes = $app->routes;

	$routes->get('/')->to('index#list');
}

1;
