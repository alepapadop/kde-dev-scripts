#!/usr/bin/perl -w

# Laurent Montel <montel@kde.org> (2014)
# KAction -> QAction
# find -iname "*.cpp" -o -iname "*.h"|xargs kde-dev-scripts/kf5/convert-kaction.pl

use strict;
use File::Basename;
use lib dirname($0);
use functionUtilkde;

foreach my $file (@ARGV) {

    my %headersToAdd = ();
    my $modified;
    open(my $FILE, "<", $file) or warn "We can't open file $file:$!\n";
    my @l = map {
        my $orig = $_;
        s/\bnew KAction\b/new QAction/;
        s/\bKAction\s*\*/QAction \*/;
        s!KDE/KAction\b!QAction!;
        s!#include \<KAction\>!#include \<QAction\>!;
        s!#include \<kaction.h\>!#include \<QAction\>!;
        s!class KAction;!class QAction;!;
        if (/setHelpText\b/) {
           warn "$file: QAction doesn't support setHelpText, just reimplement it in your code see kaction.cpp\n";
        }
        if (/setShortcutConfigurable/) {
           warn "$file: QAction doesn't support directly setShortcutConfigurable, use KActionCollection::setShortcutsConfigurable(QAction *action, bool configurable)\n";
        }
        s/\bKAction\b/QAction/g;

        # While we're here...
        if (s/KAuthorized::authorizeUrlAction/KUrlAuthorized::authorizeUrlAction/g) {
            $headersToAdd{'kurlauthorized.h'} = 1;
        }

        $modified ||= $orig ne $_;
        $_;
    } <$FILE>;

    if ($modified) {
        open (my $OUT, ">", $file);
        print $OUT @l;
        close ($OUT);
        foreach my $include (keys %headersToAdd) {
            functionUtilkde::addIncludeInFile($file, $include);
        }
    }
}

functionUtilkde::diffFile( "@ARGV" );
