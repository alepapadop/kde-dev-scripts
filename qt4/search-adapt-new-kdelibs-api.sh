#!/bin/sh
egrep -rl '(kaccelmanager.h|KStringHandler::matchFilename|KStringHandler::ljust|KStringHandler::rjust|KStringHandler::word|KApplication::random|KFindDialog::WholeWordsOnly|KFindDialog::FromCursor|KFindDialog::SelectedText|KFindDialog::CaseSensitive|KFindDialog::FindBackwards|KFindDialog::RegularExpression|KFindDialog::FindIncremental|KFindDialog::MinimumUserOption|kdatetbl.h|makeHBoxMainWidget|makeVBoxMainWidget|addHBoxPage|addVBoxPage|isRestored)'  * | egrep -v '\.(svn|libs|o|moc|l[ao])|Makefile(.in)?' 
