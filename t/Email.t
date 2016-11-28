use warnings;
use strict;
use Test::Most;

my $class = 'Test::Health::Email';

require_ok('Test::Health::Email');
can_ok( $class, qw(get_host get_to get_from send_email _create_transport) );
dies_ok { $class->new( {} ) } 'require attributes during object creation';
dies_ok { $class->new( { to => [], from => 'ihioh' } ) }
'exception with invalid value for "to" attribute';
dies_ok { $class->new( { to => 'yugyugyug', from => undef } ) }
'exception with invalid value for "from" attribute';
my $instance =
  $class->new( { to => 'john@foo.bar', from => 'lenny@foob.bar' } );
isa_ok( $instance, $class );
is($instance->get_host, 'localhost', 'instance host attribute defaults to');

done_testing;
