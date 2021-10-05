package Phonebook::Controller;
use Mojo::Base 'Mojolicious::Controller';
use common::sense;

has description => 'Base class for Controller';

sub new { shift->SUPER::new(@_) }

sub generator { 'Phonebook - ' . $Phonebook::VERSION }

1;
