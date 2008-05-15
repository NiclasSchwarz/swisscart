<?php
/*
  $Id: categories.php,v 1.23 2002/11/12 14:09:30 dgw_ Exp $

  osCommerce, Open Source E-Commerce Solutions
  http://www.oscommerce.com

  Copyright (c) 2002 osCommerce
  Copyright (c) 2003 Rodolphe Quiedeville <rodolphe@quiedeville.org>

  Released under the GNU General Public License

  Ti use this box call rss.php?box=categories
*/



  $categories_string = '';

  $categories_query = tep_db_query("select c.categories_id, cd.categories_name, c.parent_id from " . TABLE_CATEGORIES . " c, " . TABLE_CATEGORIES_DESCRIPTION . " cd where c.parent_id = '0' and c.categories_id = cd.categories_id and cd.language_id='" . $languages_id ."' order by sort_order, cd.categories_name");
while ($categories = tep_db_fetch_array($categories_query)) 
{

  $foo[$categories['categories_id']] = array(
					     'name' => $categories['categories_name'],
					     'parent' => $categories['parent_id'],
					     'level' => 0,
					     'path' => $categories['categories_id'],
					     'next_id' => false
					     );

  if (isset($prev_id))
    {
      $foo[$prev_id]['next_id'] = $categories['categories_id'];
    }
  
  $prev_id = $categories['categories_id'];
  
  if (!isset($first_element)) {
    $first_element = $categories['categories_id'];
  }

  /* 
   * Print
   */

  print "    <item>\n";

  print "      <title>".$categories['categories_name'] ."</title>\n";

  print "      <link>".tep_href_link(FILENAME_DEFAULT, "cPath=".$categories['categories_id'])  . "</link>\n";

  print "    </item>\n\n";

}



?>

