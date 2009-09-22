use strict;
use warnings;
use File::Path qw(rmtree);
use autodie;

my $home = glob('~') . '/';
my @dirs = qw(p1 p2);
my %swap = (@dirs, reverse(@dirs));

my $link = 'p';

my $now = readlink $link;
my $other = $swap{$now};

chdir "${home}rakudo";

system($^X, 'Configure.pl', '--gen-parrot',
		"--gen-parrot-prefix=$home$other");
system('make')                  and die $?;
system('make', 'install')       and die $?;
system("git rev-parse HEAD | cut -b 1,2,3,4,5,6 > $home$other/rakudo-revision") and warn $?;

eval {
	chdir glob('~/blizkost/');
    system('make', 'clean');        # may fail, nor warning here
	system('git', 'pull')           and warn $?;
	system($^X, 'Configure.pl', "--parrot-config=$home$other/bin/parrot_config")
		and warn $?;
	system('make') 			and warn $?;
	system('make', 'install') 	and warn $?;
};


chdir $home;
unlink $link;
symlink $other, $link;
