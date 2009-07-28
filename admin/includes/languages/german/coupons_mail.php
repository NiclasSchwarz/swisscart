<?php
/*
  $Id: mail.php,v 1.9 2002/01/19 22:44:34 harley_vb Exp $

  osCommerce, Open Source E-Commerce Solutions
  http://www.oscommerce.com

  Copyright (c) 2002 osCommerce

  Released under the GNU General Public License
*/

define('HEADING_TITLE', 'Gutschein an Kunden versenden');

define('TEXT_CUSTOMER', 'Kunde:');
define('TEXT_SUBJECT', 'Betreff:');
define('TEXT_FROM', 'Absender:');
define('TEXT_CODE', 'Code:');
define('TEXT_WERT', 'Wert:');
define('TEXT_MESSAGE', 'Nachricht:');
define('TEXT_SELECT_CUSTOMER', 'Kunden ausw&auml;hlen');
define('TEXT_ALL_CUSTOMERS', 'Alle Kunden');
define('TEXT_NEWSLETTER_CUSTOMERS', 'An alle Newsletter-Abonnenten');

define('TEXT_SUBJECT_VALUE', 'Gutschein von XXX');
define('TEXT_MESSAGE_VALUE', 'Sehr geehrte Damen und Herren,

mit dieser eMail erhalten Sie einen Gutschein von XXX im
Wert von <!WERT>.

Gutscheincode: <!CODE>

Um diesen einzul�sen besuchen Sie bitte unseren Online-Shop unter XXX!
Auf der rechten Seite haben Sie die M�glichkeit den oben geannten Code einzugeben.

Mit freundlichen Gr��en');

define('NOTICE_EMAIL_SENT_TO', 'Hinweis: eMail wurde versendet an: %s');
define('ERROR_NO_CUSTOMER_SELECTED', 'Fehler: Es wurde kein Kunde ausgew&auml;hlt.');

define('TEXT_INFO_VARIABLES', 'Es k�nnen folgende zwei Variablen im eMail-Text verwendet werden: <ul><li><strong>&lt;!WERT&gt;</strong> (Anzeige des Gutscheinwertes)</strong></li><li><strong>&lt;!CODE&gt;</strong> (Anzeige des Gutscheincodes)</li></ul>');
?>