<?php
/*
  $Id: index.php,v 1.3 2003/07/08 16:56:04 dgw_ Exp $

  osCommerce, Open Source E-Commerce Solutions
  http://www.oscommerce.com

  Customized by swisscart�, Swiss Webshop Solutions
  http://www.swisscart.com

  Copyright (c) 2003-2007 osCommerce

  Released under the GNU General Public License
*/

define('TEXT_GREETING_PERSONAL', 'Bienvenido de nuevo <span class="greetUser">%s!</span> &iquest;Le gustaria ver que <a href="%s"><u>nuevos productos</u></a> hay disponibles?');
define('TEXT_GREETING_PERSONAL_RELOGON', '<small>Si no es %s, por favor <a href="%s"><u>entre aqui</u></a> e introduzca sus datos.</small>');
define('TEXT_GREETING_GUEST', 'Bienvenido <span class="greetUser">Invitado!</span> &iquest;Le gustaria <a href="%s"><u>entrar en su cuenta</u></a> o preferiria <a href="%s"><u>crear una cuenta nueva</u></a>?');

define('TEXT_MAIN', '<div style="height: 170px; overflow: auto; border: 1px solid silver; ">Esta es la configuraci&oacute;n por defecto de osCommerce, los productos mostrados aqui son &uacute;nicamente para demonstraci&oacute;n, <b>cualquier compra realizada no ser&aacute; entregada al cliente, ni se le cobrar&aacute;</b>. Cualquier informaci&oacute;n que vea sobre estos productos debe ser tratada como ficticia.<br><br>Si desea descargar la soluci&oacute;n que hace posible esta tienda, o si quiere contribuir al proyecto de osCommerce, por favor visite <a href="http://www.oscommerce.com" target="_blank"><u>la web de soporte de osCommerce</u></a>. Esta tienda corre bajo la version <font color="#f0000"><b>' . PROJECT_VERSION . '</b></font>.<br><br>Este texto se puede cambiar editando el siguiente fichero, uno por cada idioma: [camino&nbsp;al&nbsp;cat&aacute;logo]/includes/languages/[language]/default.php.<br><br>Puede editarlo manualmente, o a traves de la Herramienta de Administraci&oacute;n con la opci&oacute;n Idiomas->[idioma]->Definir, o utilizando el Herramientas->Administrador de Ficheros.</div>');
define('TABLE_HEADING_NEW_PRODUCTS', 'Nuevos Productos En %s');
define('TABLE_HEADING_FEATURED_PRODUCTS', 'Productos Destacados');
define('TABLE_HEADING_FEATURED_PRODUCTS_CATEGORY', 'Productos Destacados en %s');
define('TABLE_HEADING_UPCOMING_PRODUCTS', 'Pr&oacute;ximamente');
define('TABLE_HEADING_DATE_EXPECTED', 'Lanzamiento');

if ( ($category_depth == 'products') || (isset($HTTP_GET_VARS['manufacturers_id'])) ) {
  define('HEADING_TITLE', 'A ver que tenemos aqui');
  define('TABLE_HEADING_IMAGE', '');
  define('TABLE_HEADING_MODEL', 'Modelo');
  define('TABLE_HEADING_PRODUCTS', 'Productos');
  define('TABLE_HEADING_MANUFACTURER', 'Fabricante');
  define('TABLE_HEADING_QUANTITY', 'Cantidad');
  define('TABLE_HEADING_PRICE', 'Precio');
  define('TABLE_HEADING_WEIGHT', 'Peso');
  define('TABLE_HEADING_BUY_NOW', 'Compre Ahora');
  define('TEXT_NO_PRODUCTS', 'No hay productos en esta categoria.');
  define('TEXT_NO_PRODUCTS2', 'No hay productos de este fabricante.');
  define('TEXT_NUMBER_OF_PRODUCTS', 'N&uacute;mero de Productos: ');
  define('TEXT_SHOW', '<b>Mostrar:</b>');
  define('TEXT_BUY', 'Compre 1 \'');
  define('TEXT_NOW', '\' ahora');
  define('TEXT_ALL_CATEGORIES', 'Todas');
  define('TEXT_ALL_MANUFACTURERS', 'Todos');
  define('TEXT_MANUFACTURERS_REGION', 'Region');
  define('TEXT_MANUFACTURERS_COUNTRY', 'Country');
  define('TEXT_MANUFACTURERS_DESCRIPTION', 'Description');
} elseif ($category_depth == 'top') {
  define('HEADING_TITLE', '&iquest;Que hay de nuevo por aqui?');
} elseif ($category_depth == 'nested') {
  define('HEADING_TITLE', 'Categorias');
}
?>
