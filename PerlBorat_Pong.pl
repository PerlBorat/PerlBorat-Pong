#!/usr/bin/env perl
use strict;
use warnings;
use 5.010;

# PerlBorat version for famous game of bouncing ball
# https://github.com/PerlBorat

# make lot of side affect for pretend be imperative programmer
my $p1_score  = 0;
my $cpu_score = 0;
my $width     = 45;
my $rule      = '-' x ( $width - 1 );
my $blank = ' ' x ( ( $width - 3 ) / 2 ) . 'm' . ' ' x ( ( $width - 3 ) / 2 );
my $padding = ' ' x ( ( $width - 5 ) / 2 );
my $temp    = 'la' . $padding . 'm' . ' ' . $padding . 'br';
my $wipe    = "\n" x 25;
my $score_line;

wipe();
mid_left();
mid_mid();
mid_right();
top_mid();
lose();

# make lot of sub for pretend be functional programmer

sub mid_left {
    $score_line = "PLAYER: $p1_score" . $padding . "PERL: $cpu_score\n";
    my $row = join "\n", ( $rule, $blank, $temp, $blank, $rule, $score_line );
    $row =~ s/[lr]/|/g;
    $row =~ s/a/*/;
    $row =~ s/[bm]//g;
    say $row;
    system "sleep 1s";
    wipe();

} ## end sub mid_left

sub mid_mid {
    $score_line = "PLAYER: $p1_score" . $padding . "PERL: $cpu_score\n";
    my $row = join "\n", ( $rule, $blank, $temp, $blank, $rule, $score_line );
    $row =~ s/m//;
    $row =~ s/m/*/;
    $row =~ s/m//;
    $row =~ s/[lr]/|/g;
    $row =~ s/[ab]//g;
    say $row;
    system "sleep 1s";
    wipe();

} ## end sub mid_mid

sub mid_right {
    say '&pong_hack("enable");';
    say "pong_hack succeeded.";
    $score_line = "PLAYER: $p1_score" . $padding . "PERL: $cpu_score\n";
    my $row = join "\n", ( $rule, $blank, $temp, $blank, $rule, $score_line );
    $row =~ s/[lr]/|/g;
    $row =~ s/b/*/;
    $row =~ s/[am]//g;
    say $row;
    system "sleep 1s";
    wipe();

} ## end sub mid_right

sub top_mid {
    $score_line = "PLAYER: $p1_score" . $padding . "PERL: $cpu_score\n";
    my $row = join "\n", ( $rule, $blank, $temp, $blank, $rule, $score_line );
    $row =~ s/m/*/;
    $row =~ s/m/ /;
    $row =~ s/[lr]/|/g;
    $row =~ s/[abm]//g;
    say $row;
    system "sleep 1s";
    wipe();

} ## end sub top_mid

sub lose {
    $cpu_score++;
    $score_line = "PLAYER: $p1_score" . $padding . "PERL: $cpu_score\n";
    my $row = join "\n",
        ( $rule, '*' . $blank, $temp, $blank, $rule, $score_line );
    $row =~ s/[l]/|/g;
    $row =~ s/b/ |/;
    $row =~ s/[amr]//g;
    say $row;
    system "sleep 1s";
    say "\nEND OF GAME\n\n(Only fool try to play versus Perl.)";
} ## end sub lose

sub wipe {
    print "\n" x 30;
    # only work for standard terminal size of 80x25
} ## end sub wipe

# https://github.com/PerlBorat

