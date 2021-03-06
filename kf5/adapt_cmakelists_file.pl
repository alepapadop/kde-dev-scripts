#!/usr/bin/perl -w

# Laurent Montel <montel@kde.org> 2014-2015
# Modifies CMakeLists.txt to use kf5 macro
# find -iname "CMakeLists.txt" |xargs kde-dev-scripts/kf5/adapt_cmakelists_file.pl

use strict;

foreach my $file (@ARGV) {
open(my $FILE, "<", $file) || die;
my $modified = 0;
my @l = map {
  my $orig = $_;
  if (/kde4_no_enable_final/i) {
     $_ = "";
     $modified = 1;
  }
  if (/KDE4_INCLUDE_DIR/) {
     $_ =~ s/\${KDE4_INCLUDE_DIR}//;
     $modified = 1;
  }
  if (/QT_INCLUDES/ ) {
     $_ =~ s/\${QT_INCLUDES}//;
     $modified = 1;
  }
  if (/kde4_install_icons/i) {
     $_ =~ s/kde4_install_icons/ecm_install_icons/i;
     $modified = 1;
  }
  if (/kde4_add_library/i) {
     $_ =~ s/kde4_add_library/add_library/i;
     $modified = 1;
  }
  if (/kde4_add_ui_files/i) {
     $_ =~ s/kde4_add_ui_files/ki18n_wrap_ui/i;
     $modified = 1;
  }
  if (/kde4_add_kcfg_files/i) {
      $_ =~ s/kde4_add_kcfg_files/kconfig_add_kcfg_files/i;
      $modified = 1;
  }
  if (/kde4_add_executable\s*\(\s*([\w_]+)/i) {
      my $target = $1;
      $_ =~ s/kde4_add_executable/add_executable/i;
      if (s/ NOGUI//) {
          $_ .= "ecm_mark_nongui_executable($target)\n";
      }
      if (s/ TEST//) {
          $_ .= "ecm_mark_as_test($target)\n";
      }
      $modified = 1;
  }
  if (/kde4_add_unit_test\s*\(\s*([\w_]+)/i) {
      my $target = $1;
      $_ =~ s/kde4_add_unit_test/add_executable/i;
      s/ TEST//;
      $_ .= "add_test($target $target)\n";
      $_ .= "ecm_mark_as_test($target)\n";
  }

  if (/KDE4_ENABLE_EXCEPTIONS/i) {
      $_ =~ s/set\s*\(\s*CMAKE_CXX_FLAGS\s*\"\$\{CMAKE_CXX_FLAGS\} \$\{KDE4_ENABLE_EXCEPTIONS\}\"\s*\)/kde_enable_exceptions\(\)/i;
      $_ =~ s/add_definitions\(\s*\$\{KDE4_ENABLE_EXCEPTIONS\}\s*\)/kde_enable_exceptions\(\)/i;
      $modified = 1;
  } 
  if (/qt4_add_dbus_adaptor/i) {
      $_ =~ s/qt4_add_dbus_adaptor/qt5_add_dbus_adaptor/i;
      $modified = 1;
  }
  if (/qt4_wrap_ui/i) {
      $_ =~ s/qt4_wrap_ui/ki18n_wrap_ui/i;
      $modified = 1;
  }
  if (/KDE4_KCALCORE_LIBS/) {
     $_ =~ s/\${KDE4_KCALCORE_LIBS}/KF5::CalendarCore/;
     $modified = 1;
  }
  if (/KDE4_KMIME_LIBRARY/) {
     $_ =~ s/\${KDE4_KMIME_LIBRARY}/KF5::Mime/;
     $modified = 1;
  }
  if (/KDEPIMLIBS_AKONADI_LIBS/) {
     $_ =~ s/\${KDEPIMLIBS_AKONADI_LIBS}/KF5::AkonadiCore/;
     $modified = 1;
  }
  if (/KDEPIMLIBS_KCALCORE_LIBS/) {
     $_ =~ s/\${KDEPIMLIBS_KCALCORE_LIBS}/KF5::CalendarCore/;
     $modified = 1;
  }
  if (/KDEPIMLIBS_KPIMUTILS_LIBS/) {
     $_ =~ s/\${KDEPIMLIBS_KPIMUTILS_LIBS}//;
     $modified = 1;
  }
  if (/KDEPIMLIBS_MAILTRANSPORT_LIBS/) {
     $_ =~ s/\${KDEPIMLIBS_MAILTRANSPORT_LIBS}/KF5::MailTransport/;
     $modified = 1;
  }
  if (/KDEPIMLIBS_KMIME_LIBS/) {
     $_ =~ s/\${KDEPIMLIBS_KMIME_LIBS}/KF5::Mime/;
     $modified = 1;
  }
  if (/KDEPIMLIBS_KPIMIDENTITIES_LIBS/) {
     $_ =~ s/\${KDEPIMLIBS_KPIMIDENTITIES_LIBS}/KF5::PimIdentities/;
     $modified = 1;
  }
  if (/KDE4_KIO_LIBS/) {
     $_ =~ s/\${KDE4_KIO_LIBS}/KF5::KIOCore/;
     $modified = 1;
  }
  if (/KDE4_KROSSCORE_LIBS/) {
     $_ =~ s/\${KDE4_KROSSCORE_LIBS}/KF5::KrossCore/;
     $modified = 1;
  }
  if (/QT_QTDBUS_LIBRARY/) {
     $_ =~ s/\${QT_QTDBUS_LIBRARY}/Qt5::DBus/;
     $modified = 1;
  }
  if (/QT_QTXML_LIBRARY/) {
     $_ =~ s/\${QT_QTXML_LIBRARY}/Qt5::Xml/;
     $modified = 1;
  }
  if (/QT_QTXML_LIBRARIES/) {
     $_ =~ s/\${QT_QTXML_LIBRARIES}/Qt5::Xml/;
     $modified = 1;
  }
  if (/QT_QTCORE_LIBRARY/) {
     $_ =~ s/\${QT_QTCORE_LIBRARY}/Qt5::Core/;
     $modified = 1;
  }
  if (/QT_QTCORE_LIBRARIES/) {
     $_ =~ s/\${QT_QTCORE_LIBRARIES}/Qt5::Core/;
     $modified = 1;
  }
  if (/QT_QTGUI_LIBRARY/) {
     $_ =~ s/\${QT_QTGUI_LIBRARY}/Qt5::Gui/;
     $modified = 1;
  }
  if (/QT_QTGUI_LIBRARIES/) {
     $_ =~ s/\${QT_QTGUI_LIBRARIES}/Qt5::Gui/;
     $modified = 1;
  }
  if (/QT_QTHELP_LIBRARIES/) {
     $_ =~ s/\${QT_QTHELP_LIBRARIES}/Qt5::Help/;
     $modified = 1;
  }
  if (/QT_QTNETWORK_LIBRARY/) {
     $_ =~ s/\${QT_QTNETWORK_LIBRARY}/Qt5::Network/;
     $modified = 1;
  }
  if (/QT_QTSCRIPT_LIBRARY/) {
     $_ =~ s/\${QT_QTSCRIPT_LIBRARY}/Qt5::Script/;
     $modified = 1;
  }
  if (/KDE4_KDECORE_LIBS/) {
     $_ =~ s/\${KDE4_KDECORE_LIBS}/KF5::KDELibs4Support/;
     $modified = 1;
  }
  if (/KDEPIMLIBS_KIMAP_LIBS/) {
     $_ =~ s/\${KDEPIMLIBS_KIMAP_LIBS}/KF5::IMAP/;
     $modified = 1;
  }
  if (/KDEPIMLIBS_AKONADI_KMIME_LIBS/) {
     $_ =~ s/\${KDEPIMLIBS_AKONADI_KMIME_LIBS}/KF5::AkonadiMime/;
     $modified = 1;
  }
  if (/KDE4_KNOTIFYCONFIG_LIBS/) {
     $_ =~ s/\${KDE4_KNOTIFYCONFIG_LIBS}/KF5::NotifyConfig/;
     $modified = 1;
  }
  if (/KDEPIMLIBS_KPIMTEXTEDIT_LIBS/) {
     $_ =~ s/\${KDEPIMLIBS_KPIMTEXTEDIT_LIBS}/KF5::PimTextEdit/;
     $modified = 1;
  }
  if (/KDE4_KDEWEBKIT_LIBRARY/) {
     $_ =~ s/\${KDE4_KDEWEBKIT_LIBRARY}/KF5::WebKit/;
     $modified = 1;
  }
  if (/KDEPIMLIBS_KMBOX_LIBS/) {
     $_ =~ s/\${KDEPIMLIBS_KMBOX_LIBS}/KF5::Mbox/;
     $modified = 1;
  }
  if (/QT_QTUITOOLS_LIBRARY/) {
     $_ =~ s/\${QT_QTUITOOLS_LIBRARY}/Qt5::UiTools/;
     $modified = 1;

  }
  if (/KDEPIMLIBS_KALARMCAL_LIBS/) {
     $_ =~ s/\${KDEPIMLIBS_KALARMCAL_LIBS}/KF5::AlarmCalendar/;
     $modified = 1;
  }
  if (/KDEPIMLIBS_KABC_LIBS/) {
     $_ =~ s/\${KDEPIMLIBS_KABC_LIBS}/KF5::Contacts/;
     $modified = 1;
  }
  if (/KF5::Abc/) {
     $_ =~ s/KF5::Abc/KF5::Contacts/;
     $modified = 1;
  }

  if (/KDEPIMLIBS_AKONADI_CONTACT_LIBS/) {
     $_ =~ s/\${KDEPIMLIBS_AKONADI_CONTACT_LIBS}/KF5::AkonadiContact/;
     $modified = 1;
  }
  if (/KDE4_KDEUI_LIBS/) {
     $_ =~ s/\${KDE4_KDEUI_LIBS}//;
     $modified = 1;
  }
  if (/KDEPIMLIBS_KTNEF_LIBS/) {
     $_ =~ s/\${KDEPIMLIBS_KTNEF_LIBS}/KF5::KTnef/;
     $modified = 1;
  }
  if (/KDEPIMLIBS_KBLOG_LIBS/) {
     $_ =~ s/\${KDEPIMLIBS_KBLOG_LIBS}/KF5::Blog/;
     $modified = 1;
  }
  if (/KDEPIMLIBS_AKONADI_KABC_LIBS/) {
     $_ =~ s/\${KDEPIMLIBS_AKONADI_KABC_LIBS}/KF5::AkonadiAbc/;
     $modified = 1;
  }
  if (/KDE4_KNEWSTUFF3_LIBS/) {
     $_ =~ s/\${KDE4_KNEWSTUFF3_LIBS}/KF5::NewStuff/;
     $modified = 1;
  }
  if (/KDE4_KNEWSTUFF3_LIBRARY/) {
     $_ =~ s/\${KDE4_KNEWSTUFF3_LIBRARY}/KF5::NewStuff/;
     $modified = 1;
  }
  if (/KDEPIMLIBS_KLDAP_LIBS/) {
     $_ =~ s/\${KDEPIMLIBS_KLDAP_LIBS}/KF5::KLdap/;
     $modified = 1;
  }
  if (/BALOO_LIBRARIES/) {
     $_ =~ s/\${BALOO_LIBRARIES}/Baloo/;
     $modified = 1;
  }
  if (/KDE4_KCMUTILS_LIBS/) {
     $_ =~ s/\${KDE4_KCMUTILS_LIBS}/KF5::KCMUtils/;
     $modified = 1;
  }
  if (/KDEPIMLIBS_KCALUTILS_LIBS/) {
     $_ =~ s/\${KDEPIMLIBS_KCALUTILS_LIBS}/KF5::CalendarUtils/;
     $modified = 1;
  }
  if (/KDEPIMLIBS_KHOLIDAYS_LIBS/) {
     $_ =~ s/\${KDEPIMLIBS_KHOLIDAYS_LIBS}/KF5::Holidays/;
     $modified = 1;
  }
  if (/KDE4_KUTILS_LIBS/) {
     $_ =~ s/\${KDE4_KUTILS_LIBS}//;
     $modified = 1;
  }
  if (/KDE4_KDECORE_LIBRARY/) {
     $_ =~ s/\${KDE4_KDECORE_LIBRARY}//;
     $modified = 1;
  }
  if (/KDE4_KDEUI_LIBRARY/) {
     $_ =~ s/\${KDE4_KDEUI_LIBRARY}//;
     $modified = 1;
  }
  if (/KDE4_KTEXTEDITOR_LIBS/) {
     $_ =~ s/\${KDE4_KTEXTEDITOR_LIBS}/KF5::TextEditor/;
     $modified = 1;
  }
  if (/qt4_wrap_cpp/i) {
     $_ =~ s/qt4_wrap_cpp/qt5_wrap_cpp/i;
     $modified = 1;
  }
  if (/KDEPIMLIBS_SYNDICATION_LIBS/) {
     $_ =~ s/\${KDEPIMLIBS_SYNDICATION_LIBS}/KF5::Syndication/;
     $modified = 1;
  }
  if (/KDE4_KHTML_LIBS/) {
     $_ =~ s/\${KDE4_KHTML_LIBS}/KF5::KHtml/;
     $modified = 1;
  }
  if (/KDEPIMLIBS_KONTACTINTERFACE_LIBS/) {
     $_ =~ s/\${KDEPIMLIBS_KONTACTINTERFACE_LIBS}/KF5::KontactInterface/;
     $modified = 1;
  }
  if (/KDE4_KNOTIFYCONFIG_LIBRARY/) {
     $_ =~ s/\${KDE4_KNOTIFYCONFIG_LIBRARY}/KF5::NotifyConfig/;
     $modified = 1;
  }
  if (/QT_QTDECLARATIVE_LIBRARY/) {
     $_ =~ s/\${QT_QTDECLARATIVE_LIBRARY}/Qt5::Declarative/;
     $modified = 1;
  }
  if (/QT_QTDECLARATIVE_LIBRARIES/) {
     $_ =~ s/\${QT_QTDECLARATIVE_LIBRARIES}/Qt5::Declarative/;
     $modified = 1;
  }

  if (/KDE4_KPARTS_LIBS/) {
     $_ =~ s/\${KDE4_KPARTS_LIBS}/KF5::Parts/;
     $modified = 1;
  }
  if (/KDE4_KPARTS_LIBRARY/) {
     $_ =~ s/\${KDE4_KPARTS_LIBRARY}/KF5::Parts/;
     $modified = 1;
  }

  if (/KDE4_PHONON_LIBS/) {
     $_ =~ s/\${KDE4_PHONON_LIBS}/Phonon::phonon4qt5/;
     $modified = 1;
  }
  if (/KDE4_PHONON_LIBRARY/) {
     $_ =~ s/\${KDE4_PHONON_LIBRARY}/Phonon::phonon4qt5/;
     $modified = 1;
  }

  if (/QT_QTTEST_LIBRARY/) {
     $_ =~ s/\${QT_QTTEST_LIBRARY}/Qt5::Test/;
     $modified = 1;
  }

  if (/kde4_create_handbook/i) {
     $_ =~ s/kde4_create_handbook/kdoctools_create_handbook/i;
     $modified = 1;
  }
  if (/kde4_create_manpage/i) {
     $_ =~ s/kde4_create_manpage/kdoctools_create_manpage/i;
     $modified = 1;
  }
  if (/KDEPIMLIBS_MICROBLOG_LIBS/) {
     $_ =~ s/\${KDEPIMLIBS_MICROBLOG_LIBS}/KF5::MicroBlog/;
     $modified = 1;
  }
  if (/KDE4_SOLID_LIBS/) {
     $_ =~ s/\${KDE4_SOLID_LIBS}//;
     $modified = 1;     
  }
  if (/QT_QTWEBKIT_LIBRARY/) {
     $_ =~ s/\${QT_QTWEBKIT_LIBRARY}/Qt5::WebKitWidgets/;
     $modified = 1;
  }
  if (/QT_QTSQL_LIBRARY/) {
     $_ =~ s/\${QT_QTSQL_LIBRARY}/Qt5::Sql/;
     $modified = 1;
  }
  if (/KDE4_KFILE_LIBS/) {
     $_ =~ s/\${KDE4_KFILE_LIBS}//;
     $modified = 1;
  }
  if (/KDEPIMLIBS_AKONADI_NOTES_LIBS/) {
     $_ =~ s/\${KDEPIMLIBS_AKONADI_NOTES_LIBS}/KF5::AkonadiNotes/;
     $modified = 1;
  }
  if (/KDE4_KIO_LIBRARY/) {
     $_ =~ s/\${KDE4_KIO_LIBRARY}/KF5::KIOCore/;
     $modified = 1;
  }
 
  if (/KDEVPLATFORM_INTERFACES_LIBRARIES/) {
     $_ =~ s/\${KDEVPLATFORM_INTERFACES_LIBRARIES}/KDev::Interfaces/;
     $modified = 1;
  }
  if (/KDEVPLATFORM_SHELL_LIBRARIES/) {
     $_ =~ s/\${KDEVPLATFORM_SHELL_LIBRARIES}/KDev::Shell/;
     $modified = 1;
  }
  if (/KDEVPLATFORM_LANGUAGE_LIBRARIES/) {
     $_ =~ s/\${KDEVPLATFORM_LANGUAGE_LIBRARIES}/KDev::Language/;
     $modified = 1;
  }
  if (/KDEVPLATFORM_UTIL_LIBRARIES/) {
     $_ =~ s/\${KDEVPLATFORM_UTIL_LIBRARIES}/KDev::Util/;
     $modified = 1;
  }
  if (/KDEVPLATFORM_PROJECT_LIBRARIES/) {
     $_ =~ s/\${KDEVPLATFORM_PROJECT_LIBRARIES}/KDev::Project/;
     $modified = 1;
  }
  if (/KDEVPLATFORM_OUTPUTVIEW_LIBRARIES/) {
     $_ =~ s/\${KDEVPLATFORM_OUTPUTVIEW_LIBRARIES}/KDev::OutputView/;
     $modified = 1;
  }
  if (/KDEVPLATFORM_VCS_LIBRARIES/) {
     $_ =~ s/\${KDEVPLATFORM_VCS_LIBRARIES}/KDev::Vcs/;
     $modified = 1;
  }
  if (/KDEVPLATFORM_TESTS_LIBRARIES/) {
     $_ =~ s/\${KDEVPLATFORM_TESTS_LIBRARIES}/KDev::Tests/;
     $modified = 1;
  }
  if (/KDEVPLATFORM_JSONTESTS_LIBRARIES/) {
     $_ =~ s/\${KDEVPLATFORM_JSONTESTS_LIBRARIES}/KDev::JsonTests/;
     $modified = 1;
  }
  if (/KDEVPLATFORM_DOCUMENTATION_LIBRARIES/) {
     $_ =~ s/\${KDEVPLATFORM_DOCUMENTATION_LIBRARIES}/KDev::Documentation/;
     $modified = 1;
  }
  if (/KDEVPLATFORM_DEBUGGER_LIBRARIES/) {
     $_ =~ s/\${KDEVPLATFORM_DEBUGGER_LIBRARIES}/KDev::Debugger/;
     $modified = 1;
  }
  if (/KDEVPLATFORM_SUBLIME_LIBRARIES/) {
     $_ =~ s/\${KDEVPLATFORM_SUBLIME_LIBRARIES}/KDev::Sublime/;
     $modified = 1;
  }
  if (/KDE4_THREADWEAVER_LIBRARIES/) {
     $_ =~ s/\${KDE4_THREADWEAVER_LIBRARIES}/KF5::ThreadWeaver/;
     $modified = 1;
  }
  if (/QT_AND_KDECORE_LIBS/) {
     $_ =~ s/\${QT_AND_KDECORE_LIBS}//;
     $modified = 1;
  }
  if (/KIPI_LIBRARIES/) {
     $_ =~ s/\${KIPI_LIBRARIES}/KF5::Kipi/;
     $modified = 1;
  }
  if (/KEXIV2_LIBRARIES/) {
     $_ =~ s/\${KEXIV2_LIBRARIES}/KF5::KExiv2/;
     $modified = 1;     
  }
  if (/KDCRAW_LIBRARIES/) {
     $_ =~ s/\${KDCRAW_LIBRARIES}/KF5::KDcraw/;
     $modified = 1;
  }
  if (/KSANE_LIBRARY/) {
     $_ =~ s/\${KSANE_LIBRARY}/KF5::Sane/;
     $modified = 1;
  }
  if (/kdegamesprivate/) {
     $_ =~ s/kdegamesprivate/KF5KDEGamesPrivate/;
     $modified = 1;
  }
  if (/KDECLARATIVE_LIBRARIES/) {
     $_ =~ s/\${KDECLARATIVE_LIBRARIES}/KF5::Declarative/;
     $modified = 1;
  }
  if (/kdegames/) {
     $_ =~ s/kdegames/KF5KDEGames/;
     $modified = 1;
  }
  if (/LIBKONQ_LIBRARY/) {
     $_ =~ s/\${LIBKONQ_LIBRARY}/KF5::Konq/;
     $modified = 1;
  }
  if (/QT_QTOPENGL_LIBRARY/) {
     $_ =~ s/\${QT_QTOPENGL_LIBRARY}/Qt5::OpenGL/;
     $modified = 1;
  }
  #if (/macro_optional_add_subdirectory/) {
  #   $_ =~ s/macro_optional_add_subdirectory/add_subdirectory/;
  #   $modified = 1;
  #}

  if (/qt4_add_dbus_interfaces/i) {
     $_ =~ s/qt4_add_dbus_interfaces/qt5_add_dbus_interfaces/i;
     $modified = 1;
  }
  if (/qt4_add_dbus_interface/i) {
     $_ =~ s/qt4_add_dbus_interface/qt5_add_dbus_interface/i;
     $modified = 1;
  }
  if (/qt4_generate_moc/i) {
     $_ =~ s/qt4_generate_moc/qt5_generate_moc/i;
     $modified = 1;
  }
  if (/qt4_generate_dbus_interface/i) {
     $_ =~ s/qt4_generate_dbus_interface/qt5_generate_dbus_interface/i;
     $modified = 1;
  }
  if (/kde4_install_auth_helper_files/i) {
     $_ =~ s/kde4_install_auth_helper_files/kauth_install_helper_files/i;
     $modified = 1;
  }
  if (/kde4_install_auth_actions/i) {
     $_ =~ s/kde4_install_auth_actions/kauth_install_actions/i;
     $modified = 1;
  }
  if (/qt4_add_resources/i) {
     $_ =~ s/qt4_add_resources/qt5_add_resources/i;
     $modified = 1;
  }
  if (/KDE4_INCLUDES/) {
     $_ =~ s/\${KDE4_INCLUDES}//;
     $modified = 1;
  }
  if (/KDE4_KDNSSD_LIBS/) {
     $_ =~ s/\${KDE4_KDNSSD_LIBS}/KF5::DNSSD/;
     $modified = 1;
  }

  if (/akonadi-kde/) {
     $_ =~ s/akonadi-kde//;
     $modified = 1;
  }
  if (/QT_QTSVG_LIBRARY/) {
     $_ =~ s/\${QT_QTSVG_LIBRARY}/Qt5::Svg/;
     $modified = 1;
  }
  if (/KF5::KDE4Support/) {
     $_ =~ s/KF5::KDE4Support/KF5::KDELibs4Support/;
     $modified = 1;
  }
  if (/macro_optional_add_subdirectory/i) {
     $_ =~ s/macro_optional_add_subdirectory/ecm_optional_add_subdirectory/i;
     $modified = 1;
     warn "Need to add \'include(ECMOptionalAddSubdirectory)\' in $file \n";
  }

  if (/kde4_moc_headers/i) {
     $_ = "";
     $modified = 1;
  }
  if (/\.notifyrc/) {
     my $regexp = qr/
                  ^(\s*install\s*\(\s*FILES\s+[^\s)]+\.notifyrc\s+DESTINATION\s+)
                  \$\{DATA_INSTALL_DIR\}\/[^\s)]+
                  (.*)$
                  /x; # /x Enables extended whitespace mode
     if (my ($begin, $end) = $_ =~ $regexp) {
        $_ = $begin . "\${KNOTIFYRC_INSTALL_DIR}" . $end . "\n";
        $modified = 1;
     } elsif (not /KNOTIFYRC_INSTALL_DIR/ and not /_INSTALL_KNOTIFY5RCDIR/) {
        my $line = $_;
        $line =~ s/\s*$//;
        print "Could not fix a .notifyrc file installation call ($line)\n"
     }
  }


  #kde4_add_app_icon(importwizard_SRCS "${CMAKE_CURRENT_SOURCE_DIR}/icons/hi*-app-kontact-import-wizard.png")
  my $kde4AppIconRegexp = qr/
               ^(\s*)                  # (1) Indentation
               kde4_add_app_icon\s*\(    # 
               (.*)\s+                   #source name
               (.*)\)$                   #end
               /x; # /x Enables extended whitespace mode
  if (my ($indent, $sourcename, $icons) = $_ =~ $kde4AppIconRegexp) {
     warn "found kde4_add_app_icon\n";
     warn "You need to increase ecm to 1.7 and add include(ECMAddAppIcon)\n";
     if ($icons =~ /\*/) {
        $_ = $indent . "file(GLOB ICONS_SRCS " . "$icons" . ")\n";
        $_ .= $indent . "ecm_add_app_icon($sourcename ICONS \${ICONS_SRCS})\n";
        $modified = 1;
     } else {
        $_ = $indent . "ecm_add_app_icon($sourcename ICONS $icons)\n";
        $modified = 1;
     }
  }
 


  #kde4_add_plugin(kio_mbox ${kio_mbox_PART_SRCS})
  my $regexp = qr/
               ^(\s*)                  # (1) Indentation
               kde4_add_plugin\s*\(    # 
               \s*([^ ]*)\s*           # (2) libname
               (.*)$                   # (3) end
               /x; # /x Enables extended whitespace mode
  if (my ($indent, $libname, $end) = $_ =~ $regexp) {
     $_ = $indent . "add_library($libname MODULE " . $end . "\n";
     $modified = 1;
  }
  my $regexpUpperCase = qr/
               ^(\s*)                  # (1) Indentation
               KDE4_ADD_PLUGIN\s*\(    # 
               \s*([^ ]*)\s*           # (2) libname
               (.*)$                   # (3) end
               /x; # /x Enables extended whitespace mode
  if (my ($indent, $libname, $end) = $_ =~ $regexpUpperCase) {
     $_ = $indent . "add_library($libname MODULE " . $end . "\n";
     $modified = 1;
  }
  # At the end include_directories can be empty
  if (/include_directories\s*\(\s*\)/i) {
     $_ = "";
     $modified = 1;
  }
  $modified ||= $orig ne $_;
  $_;
} <$FILE>;

if ($modified) {
    open (my $OUT, ">", $file);
    print $OUT @l;
    close ($OUT);
}
}
