#!/usr/bin/perl -w
# vim:sw=4:et
# (c) Dirk Mueller. GPLv2+
# I would love to be a python script, but os.popen just sucks

use strict;

my %whitelist;
my %blacklist;
my @blacklist_revs;

foreach my $who(
    'adawit',
    'ahartmetz',
    'alexmerry',
    'amantia',
    'annma',
    'apaku',
    'arendjr',
    'aseigo',
    'aumuell',
    'binner',
    'bjacob',
    'bmeyer',
    'boemann',
    'bvirlet',
    'cconnell',
    'chani',
    'charles',
    'chehrlic',
    'cies',
    'cniehaus',
    'coolo',
    'craig',
    'cschlaeg',
    'cschumac',
    'cullmann',
    'danimo',
    'dfaure',
    'dimsuz',
    'djurban',
    'dmacvicar',
    'dymo',
    'edghill',
    'emmott',
    'ereslibre',
    'ervin',
    'espen',
    'fela',
    'fizz',
    'fredrik',
    'gogolok',
    'goossens',
    'granroth',
    'hausmann',
    'harald',
    'harris',
    'hdhoang',
    'ingwa',
    'isaac',
    'jens',
    'johnflux',
    'jriddell',
    'rodda',
    'raggi',
    'kainhofe',
    'kleag�', 
    'knight',
    'krake',
    'laidig',
    'lunakl',
    'lure',
    'lypanov',
    'marchand',
    'martyn',
    'mattr',
    'mbroadst',
    'menard',
    'mfranz',
    'milliams',
    'mkretz',
    'mlaurent',
    'mlarouche',
    'mm',
    'mpyne',
    'msoeken',
    'mueller',
    'mvaldenegro',
    'nielsslot',
    'okellogg',
    'onurf',
    'osterfeld',
    'piacentini',
    'pino',
    'pitagora',
    'ppenz',
    'pstirnweiss',
    'pvicente',
    'quique',
    'raabe',
    'ralsina',
    'rich',
    'rohanpm',
    'silberstorff',
    'thiago',
    'thorbenk',
    'tilladam',
    'tmcguire',
    'toma',
    'treat',
    'trueg',
    'uwolfer',
    'waba',
    'wgreven',
    'whiting',
    'winterz',
    'woebbe',
    'wstephens',
    'zachmann',
    'zander'
) {
    $whitelist{"gplv23"}->{$who} = 1;
}

foreach my $who(
    'adawit',
    'ahartmetz',
    'alexmerry',
    'amantia',
    'annma',
    'apaku',
    'arendjr',
    'aseigo',
    'aumuell',
    'binner',
    'bjacob',
    'bmeyer',
    'boemann',
    'bvirlet',
    'cconnell',
    'chani',
    'charles',
    'chehrlic',
    'cies',
    'cniehaus',
    'coolo',
    'craig',
    'cschlaeg',
    'cschumac',
    'cullmann',
    'danimo',
    'dfaure',
    'dimsuz',
    'djurban',
    'dmacvicar',
    'dymo',
    'edghill',
    'emmott',
    'ereslibre',
    'ervin',
    'espen',
    'fela',
    'fizz',
    'fredrik',
    'gogolok',
    'goossens',
    'granroth',
    'hausmann',
    'harald',
    'harris',
    'hdhoang',
    'ingwa',
    'isaac',
    'jens',
    'johnflux',
    'jriddell',
    'rodda',
    'raggi',
    'kainhofe',
    'kleag',
    'knight',
    'krake',
    'laidig',
    'lunakl',
    'lure',
    'lypanov',
    'marchand',
    'martyn',
    'mattr',
    'mbroadst',
    'mfranz',
    'milliams',
    'mkretz',
    'mlaurent',
    'menard',
    'mlarouche',
    'mm',
    'mpyne',
    'msoeken',
    'mueller',
    'mvaldenegro',
    'nielsslot',
    'okellogg',
    'onurf',
    'osterfeld',
    'pino',
    'pitagora',
    'ppenz',
    'piacentini',
    'pstirnweiss',
    'pvicente',
    'quique',
    'raabe',
    'ralsina',
    'rich',
    'rohanpm',
    'silberstorff',
    'thiago',
    'thorbenk',
    'tilladam',
    'tmcguire',
    'toma',
    'treat',
    'trueg',
    'uwolfer',
    'waba',
    'wgreven',
    'whiting',
    'winterz',
    'woebbe',
    'wstephens',
    'zachmann',
    'zander'
) {
    $whitelist{"lgplv23"}->{$who} = 1;
}

foreach my $who(
    'ahartmetz',
    'alexmerry',
    'annma',
    'apaku',
    'arendjr',
    'aseigo',
    'aumuell',
    'bjacob',
    'bmeyer',
    'boemann',
    'bvirlet',
    'cconnell',
    'chani',
    'charles',
    'chehrlic',
    'cies',
    'codrea',
    'cniehaus',
    'coolo',
    'craig',
    'cschumac',
    'danimo',
    'dfaure',
    'dimsuz',
    'djurban',
    'dmacvicar',
    'dymo',
    'edghill',
    'emmott',
    'ereslibre',
    'ervin',
    'espen',
    'fela',
    'fizz',
    'gogolok',
    'goossens',
    'granroth',
    'hausmann',
    'harald',
    'harris',
    'hdhoang',
    'ingwa',
    'isaac',
    'jens',
    'johnflux',
    'jriddell',
    'rodda',
    'raggi',
    'kainhofe',
    'kleag',
    'knight',
    'krake',
    'laidig',
    'lunakl',
    'lure',
    'lypanov',
    'marchand',
    'martyn',
    'mattr',
    'menard',
    'mfranz',
    'milliams',
    'mlaurent',
    'mlarouche',
    'mm',
    'mpyne',
    'msoeken',
    'mueller',
    'mutz',
    'mvaldenegro',
    'nielsslot',
    'okellogg',
    'onurf',
    'ossi',
    'osterfeld',
    'pino',
    'pitagora',
    'ppenz',
    'piacentini',
    'pstirnweiss',
    'pvicente',
    'quique',
    'ralsina',
    'rohanpm',
    'silberstorff',
    'thiago',
    'thorbenk',
    'tilladam',
    'tmcguire',
    'toma',
    'treat',
    'trueg',
    'uwolfer',
    'wgreven',
    'whiting',
    'winterz',
    'woebbe',
    'wstephens',
    'zachmann',
    'zander'
) {
    $whitelist{"gplv2+"}->{$who} = 1;
}

foreach my $who(
    'ahartmetz',
    'alexmerry',
    'annma',
    'apaku',
    'arendjr',
    'aseigo',
    'aumuell',
    'bjacob',
    'bmeyer',
    'boemann',
    'bvirlet',
    'cconnell',
    'chani',
    'charles',
    'chehrlic',
    'cies',
    'codrea',
    'cniehaus',
    'coolo',
    'craig',
    'cschumac',
    'danimo',
    'dfaure',
    'dimsuz',
    'djurban',
    'dmacvicar',
    'dymo',
    'edghill',
    'emmott',
    'ereslibre',
    'ervin',
    'espen',
    'fela',
    'fizz',
    'gogolok',
    'goossens',
    'granroth',
    'hausmann',
    'harald',
    'harris',
    'hdhoang',
    'ingwa',
    'isaac',
    'jens',
    'johnflux',
    'jriddell',
    'rodda',
    'raggi',
    'kainhofe',
    'kleag',
    'knight',
    'krake',
    'laidig',
    'lunakl',
    'lure',
    'lypanov',
    'marchand',
    'martyn',
    'mattr',
    'menard',
    'mfranz',
    'milliams',
    'mlaurent',
    'mlarouche',
    'mm',
    'mpyne',
    'msoeken',
    'mueller',
    'mutz',
    'mvaldenegro',
    'nielsslot',
    'okellogg',
    'onurf',
    'ossi',
    'osterfeld',
    'pino',
    'pitagora',
    'ppenz',
    'piacentini',
    'pstirnweiss',
    'pvicente',
    'quique',
    'ralsina',
    'rohanpm',
    'silberstorff',
    'thiago',
    'thorbenk',
    'tilladam',
    'tmcguire',
    'toma',
    'treat',
    'trueg',
    'uwolfer',
    'wgreven',
    'whiting',
    'winterz',
    'woebbe',
    'wstephens',
    'zachmann',
    'zander'
) {
    $whitelist{"lgplv2+"}->{$who} = 1;
}

my $file = $ARGV[0] || "";

die "need existing file: $file" if (! -r $file);

open(IN, "-|") || exec 'svn', 'log', '-q', $file;
while(<IN>) {

    if (/^r(\d+) \| (\S+) /)  {
        my ($rev, $author) = ($1, $2);

        next if ($author eq "scripty" or $author eq "(no");

        foreach my $license(keys %whitelist) {
            if (!defined($whitelist{$license}->{$author})) {
                push(@{$blacklist{$license}->{$author}}, $rev);
            }
        }
    }
}
close(IN);

my %loc_author = ();

if (-f $file) {
    open(IN, "-|") || exec 'svn', 'ann', $file;
    while(<IN>) {
        my ($author) = (split)[1];
        $loc_author{$author}++;
    }
    close(IN);
}

if (defined (keys %blacklist)) {
    print "Need permission for licensing:\n\n";

    my %stat;

    foreach my $license(keys %blacklist) {
        print "- $license:\n";
        foreach my $who(keys %{$blacklist{$license}}) {
            $stat{$license} += length(@{$blacklist{$license}->{$who}});
            printf "%9s (%4d LOC): %s \n", $who, $loc_author{$who} || 0, join(",", @{$blacklist{$license}->{$who}});
        }
        print "\n";
    }

    print "\n";
    print "Summary:\n";

    foreach my $license(sort { $stat{$a} <=> $stat{$b} } keys %stat) {
        printf "%5d commits possibly violating %s\n", $stat{$license}, $license
    }
}
