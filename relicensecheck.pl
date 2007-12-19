#!/usr/bin/perl -w
# vim:sw=4:et
# (c) Dirk Mueller. GPLv2+
# I would love to be a python script, but os.popen just sucks

use strict;

my %ruletable;
my %blacklist;
my %whitelist;
my @blacklist_revs;

# licensing table. 

my %license_table = (
    'aacid'     => ['gplv23', 'lgplv23', 'gplv2+', 'lgplv2+', '+eV' ],
    'adawit'    => ['gplv23', 'lgplv23',                      '+eV' ],
    'bischoff'  => ['gplv23', 'lgplv23', 'gplv2+', 'lgplv2+', '+eV' ],
    'denis'     => ['gplv23', 'lgplv23', 'gplv2+', 'lgplv2+', '+eV' ],
    'dyp'       => ['gplv23', 'lgplv23', 'gplv2+', 'lgplv2+', '+eV' ],
    'dfaure'    => ['gplv23', 'lgplv23', 'gplv2+', 'lgplv2+', '+eV' ],
    'eros'      => ['gplv23', 'lgplv23', 'gplv2+', 'lgplv2+', '+eV' ],
    'fawcett'   => ['gplv23', 'lgplv23', 'gplv2+', 'lgplv2+', '+eV' ],
    'jlee'      => ['gplv23', 'lgplv23', 'gplv2+', 'lgplv2+', '+eV' ],
    'mbritton'  => ['gplv23', 'lgplv23', 'gplv2+', 'lgplv2+', '+eV' ],
    'mirko'     => ['gplv23', 'lgplv23', 'gplv2+', 'lgplv2+', '+eV' ],
    'mueller'   => ['gplv23', 'lgplv23', 'gplv2+', 'lgplv2+'        ],
    'ogoffart'  => ['gplv23', 'lgplv23', 'gplv2+', 'lgplv2+', '+eV' ],
    'pino'      => ['gplv23', 'lgplv23', 'gplv2+', 'lgplv2+', '+eV' ],
    'reiher'    => ['gplv23', 'lgplv23',                      '+eV' ],
    'robbilla'  => ['gplv23', 'lgplv23', 'gplv2+', 'lgplv2+'        ],
    'taj'       => ['gplv23', 'lgplv23', 'gplv2+', 'lgplv2+'        ],
    'teske'	    => ['gplv23', 'lgplv23',                            ],
    'waba'      => ['gplv23', 'lgplv23',                      '+eV' ],
    'willy'     => ['gplv23', 'lgplv23', 'gplv2+', 'lgplv2+', '+eV' ],
);

foreach my $who (keys %license_table) {
    foreach my $license(@{$license_table{$who}}) {
        $ruletable{$license}->{$who} = 1;
    }
}

#### this is the older listing, do not modify it anymore!

foreach my $who(
    'adawit',
    'adridg',
    'ahartmetz',
    'alexmerry',
    'amantia',
    'amth',
    'annma',
    'apaku',
    'arendjr',
    'aseigo',
    'aumuell',
    'binner',
    'bjacob',
    'bmeyer',
    'boemann',
    'borgese',
    'bram',
    'braxton',
    'bvirlet',
    'cartman',
    'cconnell',
    'chani',
    'charles',
    'chehrlic',
    'cies',
    'clee',
    'cniehaus',
    'coolo',
    'craig',
    'cschlaeg',
    'cschumac',
    'cullmann',
    'danimo',
    'dannya',
    'dimsuz',
    'djurban',
    'dmacvicar',
    'dymo',
    'edghill',
    'emmott',
    'epignet',
    'ereslibre',
    'ervin',
    'espen',
    'fela',
    'fizz',
    'fredrik',
    'gladhorn',
    'gogolok',
    'goossens',
    'granroth',
    'gyurco',    
    'hausmann',
    'harald',
    'harris',
    'hedlund',
    'helio',
    'hdhoang',
    'howells',
    'hschaefer',
    'huerlimann',
    'ilic',
    'ingwa',
    'isaac',
    'jens',
    'jlayt',
    'johach',
    'johnflux',
    'jriddell',
    'rodda',
    'raggi',
    'rjarosz',
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
    'mcamen',
    'menard',
    'mfranz',
    'micron',
    'milliams',
    'mkretz',
    'mlaurent',
    'mlarouche',
    'mm',
    'mpyne',
	 'mrudolf',
    'msoeken',
    'mstocker',
    'mueller',
    'mvaldenegro',
    'mwoehlke',
    'nielsslot',
    'ogoffart',
    'okellogg',
    'onurf',
    'orzel',
    'osterfeld',
    'pfeiffer',
    'piacentini',
    'pitagora',
    'ppenz',
    'pstirnweiss',
    'putzer',
    'pvicente',
    'quique',
    'raabe',
    'rahn',
    'ralsina',
    'rich',
    'rempt',
    'roffet',
    'rohanpm',
    'schmeisser',
    'schwarzer',
    'sebsauer',
    'shaforo',
    'shipley',
    'silberstorff',
    'thiago',
    'thorbenk',
    'tilladam',
    'tmcguire',
    'toma',
    'tokoe',
    'treat',
    'troeder',
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
    $ruletable{"gplv23"}->{$who} = 1;
}

foreach my $who(
    'adawit',
    'adridg',
    'ahartmetz',
    'alexmerry',
    'amantia',
    'amth',
    'annma',
    'apaku',
    'arendjr',
    'aseigo',
    'aumuell',
    'binner',
    'bjacob',
    'bmeyer',
    'boemann',
    'borgese',
    'bram',
    'braxton',
    'bvirlet',
    'cartman',
    'cconnell',
    'chani',
    'charles',
    'chehrlic',
    'cies',
    'clee',
    'cniehaus',
    'coolo',
    'craig',
    'cschlaeg',
    'cschumac',
    'cullmann',
    'danimo',
    'dannya',
    'dimsuz',
    'djurban',
    'dmacvicar',
    'dymo',
    'edghill',
    'emmott',
    'epignet',
    'ereslibre',
    'ervin',
    'espen',
    'fela',
    'fizz',
    'fredrik',
    'gladhorn',
    'gogolok',
    'goossens',
    'gyurco',
    'granroth',
    'hausmann',
    'harald',
    'harris',
    'hedlund',
    'helio',
    'hdhoang',
    'howells',
    'huerlimann',
    'ilic',
    'ingwa',
    'isaac',
    'jens',
    'jlayt',
    'johach',
    'johnflux',
    'jriddell',
    'rodda',
    'raggi',
    'rjarosz',
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
    'mcamen',
    'mfranz',
    'micron',
    'milliams',
    'mkretz',
    'mlaurent',
    'menard',
    'mlarouche',
    'mm',
    'mpyne',
	 'mrudolf',
    'msoeken',
    'mstocker',
    'mueller',
    'mvaldenegro',
    'mwoehlke',
    'nielsslot',
    'ogoffart',
    'okellogg',
    'onurf',
    'orzel',
    'osterfeld',
    'pfeiffer',
    'pitagora',
    'ppenz',
    'piacentini',
    'pstirnweiss',
    'putzer',
    'pvicente',
    'quique',
    'raabe',
    'rahn',
    'ralsina',
    'rempt',
    'rich',
    'roffet',
    'rohanpm',
    'schmeisser',
    'schwarzer',
    'sebsauer',
    'shaforo',
    'shipley',
    'silberstorff',
    'thiago',
    'thorbenk',
    'tilladam',
    'tmcguire',
    'toma',
    'tokoe',
    'treat',
    'troeder',
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
    $ruletable{"lgplv23"}->{$who} = 1;
}

foreach my $who(
    'ahartmetz',
    'alexmerry',
    'amth',
    'annma',
    'apaku',
    'arendjr',
    'aseigo',
    'aumuell',
    'bjacob',
    'bmeyer',
    'boemann',
    'borgese',
    'bram',
    'braxton',
    'bvirlet',
    'cartman',
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
    'dannya',
    'dimsuz',
    'djurban',
    'dmacvicar',
    'dymo',
    'edghill',
    'emmott',
    'epignet',
    'ereslibre',
    'ervin',
    'espen',
    'fela',
    'fizz',
    'gladhorn',
    'gogolok',
    'goossens',
    'granroth',
    'gyurco',
    'hausmann',
    'harald',
    'harris',
    'hedlund',
    'helio',
    'hdhoang',
    'howells',
    'huerlimann',
    'ilic',
    'ingwa',
    'isaac',
    'jens',
    'jlayt',
    'johach',
    'johnflux',
    'jriddell',
    'rodda',
    'raggi',
    'rjarosz',
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
    'mcamen',
    'menard',
    'mfranz',
    'micron',
    'milliams',
    'mlaurent',
    'mlarouche',
    'mm',
    'mpyne',
	 'mrudolf',
    'msoeken',
    'mstocker',
    'mueller',
    'mutz',
    'mvaldenegro',
    'nielsslot',
    'ogoffart',
    'okellogg',
    'onurf',
    'ossi',
    'orzel',
    'osterfeld',
    'pfeiffer',
    'pitagora',
    'ppenz',
    'piacentini',
    'pstirnweiss',
    'putzer',
    'pvicente',
    'quique',
    'ralsina',
    'rempt',
    'roffet',
    'rohanpm',
    'schmeisser',
    'schwarzer',
    'sebsauer',
    'shaforo',
    'shipley',
    'silberstorff',
    'thiago',
    'thorbenk',
    'tilladam',
    'tmcguire',
    'toma',
    'tokoe',
    'treat',
    'troeder',
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
    $ruletable{"gplv2+"}->{$who} = 1;
}

foreach my $who(
    'ahartmetz',
    'alexmerry',
    'amth',
    'annma',
    'apaku',
    'arendjr',
    'aseigo',
    'aumuell',
    'bjacob',
    'bmeyer',
    'boemann',
    'borgese',
    'bram',
    'braxton',
    'bvirlet',
    'cartman',
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
    'dannya',
    'dimsuz',
    'djurban',
    'dmacvicar',
    'dymo',
    'edghill',
    'emmott',
    'epignet',
    'ereslibre',
    'ervin',
    'espen',
    'fela',
    'fizz',
    'gladhorn',
    'gogolok',
    'goossens',
    'granroth',
    'gyurco',
    'hausmann',
    'harald',
    'harris',
    'hedlund',
    'helio',
    'hdhoang',
    'howells',
    'huerlimann',
    'ilic',
    'ingwa',
    'isaac',
    'jens',
    'jlayt',
    'johach',
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
    'mcamen',
    'menard',
    'mfranz',
    'micron',
    'milliams',
    'mlaurent',
    'mlarouche',
    'mm',
    'mpyne',
	 'mrudolf',
    'msoeken',
    'mstocker',
    'mueller',
    'mutz',
    'mvaldenegro',
    'nielsslot',
    'ogoffart',
    'okellogg',
    'onurf',
    'ossi',
    'orzel',
    'osterfeld',
    'pfeiffer',
    'pitagora',
    'ppenz',
    'piacentini',
    'pstirnweiss',
    'putzer',
    'pvicente',
    'quique',
    'ralsina',
    'rempt',
    'rjarosz',
    'roffet',
    'rohanpm',
    'schmeisser',
    'schwarzer',
    'sebsauer',
    'shaforo',
    'shipley',
    'silberstorff',
    'thiago',
    'thorbenk',
    'tilladam',
    'tmcguire',
    'toma',
    'tokoe',
    'treat',
    'troeder',
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
    $ruletable{"lgplv2+"}->{$who} = 1;
}

my $file = $ARGV[0] || "";

die "need existing file: $file" if (! -r $file);

open(IN, "-|") || exec 'svn', 'log', '-q', $file;
while(<IN>) {

    if (/^r(\d+) \| (\S+) /)  {
        my ($rev, $author) = ($1, $2);

        next if ($author eq "scripty" or $author eq "(no");

        foreach my $license(keys %ruletable) {
            if (!defined($ruletable{$license}->{$author})) {
                push(@{$blacklist{$license}->{$author}}, $rev);
            }
            else {
                push(@{$whitelist{$license}->{$author}}, $rev);
            }
 
        }
    }
}
close(IN);

my %loc_author = ();

if (-f $file) {
    open(IN, "-|") || exec 'svn', 'ann', '-x', '-w', $file;
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

my @allowed_list = ();

if (defined (keys %whitelist)) {
    foreach my $license(keys %whitelist) {
        next if defined($blacklist{$license});
        push(@allowed_list, $license);
    }
}

if ($#allowed_list >= 0) {
    print "\nRelicensing allowed: ". join(' ', @allowed_list) . "\n";
}

print "\ndo not forget to check copyright headers and for patches committed in the name of others!\n";
