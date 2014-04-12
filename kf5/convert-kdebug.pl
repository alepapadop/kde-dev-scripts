#!/usr/bin/perl -w

# David Faure <faure@kde.org>
# kDebug() -> qDebug()
# kWarning() -> qWarning()

use strict;
use File::Basename;
use lib dirname($0);
use functionUtilkde;

foreach my $file (@ARGV) {

    my $infoVar;
    my $urlVar;

    my $modified;
    open(my $FILE, "<", $file) or warn "We can't open file $file:$!\n";
    my @l = map {
        my $orig = $_;

        s/kDebug\(\)/qDebug\(\)/;
        s/kdDebug\(\)/qDebug\(\)/;
        s/kWarning\(\)/qWarning\(\)/;
        s/kdWarning\(\)/qWarning\(\)/;
        s/kError\(\)/qCritical\(\)/;
        s/kFatal\(\)/qFatal\(\)/;
        s/k_funcinfo/Q_FUNC_INFO/;
        s/kdebug\.h/qdebug\.h/;

        #s/\<\< endl//; # old stuff

        $modified ||= $orig ne $_;
        $_;
    } <$FILE>;

    if ($modified) {
        open (my $OUT, ">", $file);
        print $OUT @l;
        close ($OUT);
    }
}

functionUtilkde::diffFile( "@ARGV" );