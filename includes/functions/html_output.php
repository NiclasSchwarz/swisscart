<?php
/*
  $Id: html_output.php,v 1.56 2003/07/09 01:15:48 hpdl Exp $

  osCommerce, Open Source E-Commerce Solutions
  http://www.oscommerce.com

  Customized by swisscart�, Swiss Webshop Solutions
  http://www.swisscart.com

  Copyright (c) 2003-2007 osCommerce

  Released under the GNU General Public License
*/

if (SEO_URLS_ENABLED == 'true') {
////
// ULTIMATE Seo Urls 5
// The HTML href link wrapper function
  function tep_href_link($page = '', $parameters = '', $connection = 'NONSSL', $add_session_id = true, $search_engine_safe = true) {
    global $seo_urls, $languages_id, $request_type, $session_started, $sid;                
    if ( !is_object($seo_urls) ){
      include_once DIR_WS_MODULES . 'ultimate_seo_urls5/classes/usu.php';
      $seo_urls = new usu($languages_id, $request_type, $session_started, $sid);
    }
    return $seo_urls->href_link($page, $parameters, $connection, $add_session_id);
  } 
  } else {
 ////
// The HTML href link wrapper function
  function tep_href_link($page = '', $parameters = '', $connection = 'NONSSL', $add_session_id = true, $search_engine_safe = true) {
    global $request_type, $session_started, $SID;

    if (!tep_not_null($page)) {
      die('<br><br><font color="#ff0000"><b>Error!</b></font><br><br><b>Unable to determine the page link!<br><br>');
    }

    if ($connection == 'NONSSL') {
      $link = HTTP_SERVER . DIR_WS_HTTP_CATALOG;
    } elseif ($connection == 'SSL') {
      if (ENABLE_SSL == true) {
        $link = HTTPS_SERVER . DIR_WS_HTTPS_CATALOG;
      } else {
        $link = HTTP_SERVER . DIR_WS_HTTP_CATALOG;
      }
    } else {
      die('<br><br><font color="#ff0000"><b>Error!</b></font><br><br><b>Unable to determine connection method on a link!<br><br>Known methods: NONSSL SSL</b><br><br>');
    }

    if (tep_not_null($parameters)) {
      $link .= $page . '?' . tep_output_string($parameters);
      $separator = '&';
    } else {
      $link .= $page;
      $separator = '?';
    }

    while ( (substr($link, -1) == '&') || (substr($link, -1) == '?') ) $link = substr($link, 0, -1);

// Add the session ID when moving from different HTTP and HTTPS servers, or when SID is defined
    if ( ($add_session_id == true) && ($session_started == true) && (SESSION_FORCE_COOKIE_USE == 'False') ) {
      if (tep_not_null($SID)) {
        $_sid = $SID;
      } elseif ( ( ($request_type == 'NONSSL') && ($connection == 'SSL') && (ENABLE_SSL == true) ) || ( ($request_type == 'SSL') && ($connection == 'NONSSL') ) ) {
        if (HTTP_COOKIE_DOMAIN != HTTPS_COOKIE_DOMAIN) {
          $_sid = tep_session_name() . '=' . tep_session_id();
        }
      }
    }

    if ( (SEARCH_ENGINE_FRIENDLY_URLS == 'true') && ($search_engine_safe == true) ) {
      while (strstr($link, '&&')) $link = str_replace('&&', '&', $link);

      $link = str_replace('?', '/', $link);
      $link = str_replace('&', '/', $link);
      $link = str_replace('=', '/', $link);

      $separator = '?';
    }

    if (isset($_sid)) {
      $link .= $separator . $_sid;
    }

    return $link;
  }
  }


////
// The HTML image wrapper function
// modified for STS and Image Magic
function tep_image($src, $alt = '', $width = '', $height = '', $params = '') {  
  global $product_info;
  global $sts; 
  $sts->image($src); // Take image from template folder if exists.  

  // add place holder image if no image available
  if (MODULE_STS_DEFAULT_STATUS=="true") {
    $no_image = STS_TEMPLATE_DIR . DIR_WS_IMAGES;
	if ($src == $no_image) $src .= 'no-image-available.jpg';
  }
  
  //Allow for a new intermediate sized thumbnail size to be set 
  //without any changes having to be made to the product_info page itself. 
  //(see the lengths I go to to make your life easier :-)
  if (strstr($_SERVER['PHP_SELF'],"product_info.php")) {
           
        if (isset($product_info['products_image']) 
                   && $src == DIR_WS_IMAGES . $product_info['products_image']
                   && $product_info[products_id]==$_GET['products_id'])  {   //final check just to make sure that we don't interfere with other contribs
            $width = PRODUCT_INFO_IMAGE_WIDTH == 0?'':PRODUCT_INFO_IMAGE_WIDTH;
            $height = PRODUCT_INFO_IMAGE_HEIGHT == 0?'':PRODUCT_INFO_IMAGE_HEIGHT;
            $product_info_image=true;
            $page="prod_info"; 
        }
  }
  
  //Detect whether this is a pop-up image
  if (strstr($_SERVER['PHP_SELF'],"popup_image.php")) $page="popup";
         
  //do we apply the IE PNG alpha transparency fix?
  if  (strstr(strtolower($src),".png") && CFG_PNG_BUG=="True") $fix_png = true;
        
  //send the image for processing unless told otherwise
  $image = '<img src="' . $src . '"'; //set up the image tag just in case we don't want to process
  if (CFG_MASTER_SWITCH=="On") $calculate = true;
  else $calculate=false;
  
  // Don't calculate if the image is set to a "%" width
  if (strstr($width,'%') == true || strstr($height,'%') == true) $calculate = false; 

  // Dont calculate if a pixel image is being passed (hope you dont have pixels for sale)
  if (strstr($image, 'pixel')) $calculate = false;
  
  
  $image_size = @getimagesize($src);

  
  // Decide whether or not we want to process this image
  if (($width == '' && $height == '' && $page != 'popup' ) || ($width == $image_size[0] && $height == $image_size[1] && $page != 'popup')) {  
        if (CFG_PROCESS_GRAPHICS=="False") $calculate = false; //looks like this is a store graphic rather than product image
  }    

  // Is this image good to go?
  if (CONFIG_CALCULATE_IMAGE_SIZE && $calculate) { 
          
  if ($image_size) { 
      
      $ratio = $image_size[1] / $image_size[0];
      
      // Set the width and height to the proper ratio
      if (!$width && $height) { 
        $ratio = $height / $image_size[1]; 
        $width = intval($image_size[0] * $ratio); 
      } elseif ($width && !$height) { 
        $ratio = $width / $image_size[0]; 
        $height = intval($image_size[1] * $ratio); 
      } elseif (!$width && !$height && !$over_ride) { 
        $width = $image_size[0]; 
        $height = $image_size[1]; 
      } else {
        // small hack to recalculate the image thumbnail proportionally to the original dimensions
        // recalculate width or height to ajust for the image's proportions
        $rx = $width/$image_size[0];
        $ry = $height/$image_size[1];

        if ($rx > $ry) {
             $width = intval($ry * $image_size[0]);
        } else {
             $height = intval($rx * $image_size[1]);
        }
      }

      //Encrypt the image filename if switched on
        if (CFG_ENCRYPT_FILENAMES == "True" && CFG_ENCRYPTION_KEY !="") {
              $result = '';
              $key=CFG_ENCRYPTION_KEY;
              for($i=0; $i<strlen($src); $i++) {
                  $char = substr($src, $i, 1);
                  $keychar = substr($key, ($i % strlen($key))-1, 1);
                  $char = chr(ord($char)+ord($keychar));
                  $result.=$char;
              }
              $src=urlencode(base64_encode($result));
        }
            
       //Return the html
        $image = '<img src="imagemagic.php?img='.$src.'&w='.
        tep_output_string($width).'&h='.tep_output_string($height).'&page='.$page.'"';
      
    } elseif (IMAGE_REQUIRED == 'false') { 
      return false; 
    } 
  }  
  
    // If the size asked for is greater than the image itself, we check the configs to 
	// see if this is allowed and if not over-ride
	// As this should not apply for pixel_trans.gif and pixel_silver.gif some conditions
	// need to be added to the if statement otherwise all pixel_*-widths will be set to 1
  if ( ($width > $image_size[0] || $height > $image_size[1]) && (strstr($width,'%') != true || strstr($height,'%') != true)  && ((!strstr($image, 'pixel'))) ) {
        if (CFG_ALLOW_LARGER  != 'True'){
              $width=$image_size[0];
              $height=$image_size[1];
              $over_ride = true;
        }
  }
  // Add remaining image parameters if they exist
  if ($width) { 
    $image .= ' width="' . tep_output_string($width) . '"'; 
  } 
  
  if ($height) { 
    $image .= ' height="' . tep_output_string($height) . '"'; 
  }     
  
  if (tep_not_null($params)) $image .= ' ' . $params;
  
  $image .= ' border="0" alt="' . tep_output_string($alt) . '"';
  
  if (tep_not_null($alt)) {
    $image .= ' title="' . tep_output_string($alt) . '"';
  }
  
  if ($fix_png && CFG_MASTER_SWITCH=="On") {
        $image .= ' onload="fixPNG(this)"'; 
  }
  
  $image .= '>';  
  
  if (strpos($image, '&') !== false) {
	$image = str_replace('&', '&amp;', $image);
  }

  return $image; 
}

////
// Image link for lightbox extension
function tep_image_link($src, $width = POPUP_IMAGE_WIDTH, $height = POPUP_IMAGE_HEIGHT) {  
	if ($width != '' || $height != '') {
		$image_size = getimagesize($src);
		$image_ratio = $image_size[0]/$image_size[1];

		if ($width != '') {
			$height = round(POPUP_IMAGE_WIDTH / $image_ratio);
		} elseif ($height != '') {
			$width = round(POPUP_IMAGE_HEIGHT * $image_ratio);
		}
		
		return FILENAME_IMAGEMAGIC . "?img=$src&amp;w=$width&amp;h=$height&amp;page=popup";	
	} else {
		return $src;
}

}

////
// The HTML form submit button wrapper function
// Outputs a button in the selected language
  function tep_image_submit($image, $alt = '', $parameters = '') {
    global $language;

	// START STS v4.4:
	global $sts;
	$src = $sts->image_button($image,$language);
	if ($src!='')
		$image_submit = '<input type="image" src="' . tep_output_string($src) . '" alt="' . tep_output_string($alt) . '"';
	else 
	// END STS v4.4

    $image_submit = '<input type="image" src="' . tep_output_string(DIR_WS_LANGUAGES . $language . '/images/buttons/' . $image) . '" alt="' . tep_output_string($alt) . '"';

    if (tep_not_null($alt)) $image_submit .= ' title=" ' . tep_output_string($alt) . ' "';

    if (tep_not_null($parameters)) $image_submit .= ' ' . $parameters;

    $image_submit .= '>';

    return $image_submit;
  }

////
// Output a function button in the selected language
  function tep_image_button($image, $alt = '', $parameters = '') {
    global $language;

	// START STS v4.4:
	global $sts;
	$src = $sts->image_button($image, $language, true); // 3rd parameter to tell tep_image that file check has been already done
	if ($src!='') { // Take image from template folder if exists.
	  return tep_image ($src, $alt);
	}
	// END STS v4.4

    return tep_image(DIR_WS_LANGUAGES . $language . '/images/buttons/' . $image, $alt, '', '', $parameters);
  }

////
// Output a separator either through whitespace, or with an image
  function tep_draw_separator($image = 'pixel_black.gif', $width = '100%', $height = '1') {
    return tep_image(DIR_WS_IMAGES . $image, '', $width, $height);
  }

////
// Output a form
  function tep_draw_form($name, $action, $method = 'post', $parameters = '') {
    $form = '<form name="' . tep_output_string($name) . '" action="' . tep_output_string($action) . '" method="' . tep_output_string($method) . '"';

    if (tep_not_null($parameters)) $form .= ' ' . $parameters;

    $form .= '>';

    return $form;
  }

////
// Output a form input field
  function tep_draw_input_field($name, $value = '', $parameters = '', $type = 'text', $reinsert_value = true) {
    $field = '<input type="' . tep_output_string($type) . '" name="' . tep_output_string($name) . '"';

    if ( (isset($GLOBALS[$name])) && ($reinsert_value == true) ) {
      $field .= ' value="' . tep_output_string(stripslashes($GLOBALS[$name])) . '"';
    } elseif (tep_not_null($value)) {
      $field .= ' value="' . tep_output_string($value) . '"';
    }

    if (tep_not_null($parameters)) $field .= ' ' . $parameters;

    $field .= '>';

    return $field;
  }

////
// Output a form password field
  function tep_draw_password_field($name, $value = '', $parameters = 'maxlength="40"') {
    return tep_draw_input_field($name, $value, $parameters, 'password', false);
  }

////
// Output a selection field - alias function for tep_draw_checkbox_field() and tep_draw_radio_field()
  function tep_draw_selection_field($name, $type, $value = '', $checked = false, $parameters = '') {
    $selection = '<input type="' . tep_output_string($type) . '" name="' . tep_output_string($name) . '"';

    if (tep_not_null($value)) $selection .= ' value="' . tep_output_string($value) . '"';

    if ( ($checked == true) || ( isset($GLOBALS[$name]) && is_string($GLOBALS[$name]) && ( ($GLOBALS[$name] == 'on') || (isset($value) && (stripslashes($GLOBALS[$name]) == $value)) ) ) ) {
      $selection .= ' CHECKED';
    }

    if (tep_not_null($parameters)) $selection .= ' ' . $parameters;

    $selection .= '>';

    return $selection;
  }

////
// Output a form checkbox field
  function tep_draw_checkbox_field($name, $value = '', $checked = false, $parameters = '') {
    return tep_draw_selection_field($name, 'checkbox', $value, $checked, $parameters);
  }

////
// Output a form radio field
  function tep_draw_radio_field($name, $value = '', $checked = false, $parameters = '') {
    return tep_draw_selection_field($name, 'radio', $value, $checked, $parameters);
  }

////
// Output a form textarea field
  function tep_draw_textarea_field($name, $wrap, $width, $height, $text = '', $parameters = '', $reinsert_value = true) {
    $field = '<textarea name="' . tep_output_string($name) . '" wrap="' . tep_output_string($wrap) . '" cols="' . tep_output_string($width) . '" rows="' . tep_output_string($height) . '"';

    if (tep_not_null($parameters)) $field .= ' ' . $parameters;

    $field .= '>';

    if ( (isset($GLOBALS[$name])) && ($reinsert_value == true) ) {
      $field .= tep_output_string_protected(stripslashes($GLOBALS[$name]));
    } elseif (tep_not_null($text)) {
      $field .= tep_output_string_protected($text);
    }

    $field .= '</textarea>';

    return $field;
  }

////
// Output a form hidden field
  function tep_draw_hidden_field($name, $value = '', $parameters = '') {
    $field = '<input type="hidden" name="' . tep_output_string($name) . '"';

    if (tep_not_null($value)) {
      $field .= ' value="' . tep_output_string($value) . '"';
    } elseif (isset($GLOBALS[$name])) {
      $field .= ' value="' . tep_output_string(stripslashes($GLOBALS[$name])) . '"';
    }

    if (tep_not_null($parameters)) $field .= ' ' . $parameters;

    $field .= '>';

    return $field;
  }

////
// Hide form elements
  function tep_hide_session_id() {
    global $session_started, $SID;

    if (($session_started == true) && tep_not_null($SID)) {
      return tep_draw_hidden_field(tep_session_name(), tep_session_id());
    }
  }

////
// Output a form pull down menu
  function tep_draw_pull_down_menu($name, $values, $default = '', $parameters = '', $required = false) {
    $field = '<select name="' . tep_output_string($name) . '"';

    if (tep_not_null($parameters)) $field .= ' ' . $parameters;

    $field .= '>';

    if (empty($default) && isset($GLOBALS[$name])) $default = stripslashes($GLOBALS[$name]);

    for ($i=0, $n=sizeof($values); $i<$n; $i++) {
      $field .= '<option value="' . tep_output_string($values[$i]['id']) . '"';
      if ($default == $values[$i]['id']) {
        $field .= ' SELECTED';
      }

      $field .= '>' . tep_output_string($values[$i]['text'], array('"' => '&quot;', '\'' => '&#039;', '<' => '&lt;', '>' => '&gt;')) . '</option>';
    }
    $field .= '</select>';

    if ($required == true) $field .= TEXT_FIELD_REQUIRED;

    return $field;
  }

////
// Creates a pull-down list of countries
  function tep_get_country_list($name, $selected = '', $parameters = '') {
	$pd_default_id = (STORE_COUNTRY != '') ? STORE_COUNTRY : '';
	$pd_default_text = (STORE_COUNTRY != '') ? tep_get_country_name(STORE_COUNTRY) : PULL_DOWN_DEFAULT;
    $countries_array = array(array('id' => $pd_default_id, 'text' => $pd_default_text));	

    $countries = tep_get_countries();	

    for ($i=0, $n=sizeof($countries); $i<$n; $i++) {
      $countries_array[] = array('id' => $countries[$i]['countries_id'], 'text' => $countries[$i]['countries_name']);
    }

    return tep_draw_pull_down_menu($name, $countries_array, $selected, $parameters);
  }
?>
