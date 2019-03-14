
// preload images
var g_ImageOver = new Array();
g_ImageOver['LeftArrow'] = new Image();
g_ImageOver['LeftArrow'].src = IMAGES + '/mmorpg/navigation_arrow_left_over.gif';
g_ImageOver['RightArrow'] = new Image();
g_ImageOver['RightArrow'].src = IMAGES + '/mmorpg/navigation_arrow_right_over.gif';
g_ImageOver['Number01'] = new Image();
g_ImageOver['Number01'].src = IMAGES + '/mmorpg/number_01_over.gif';
g_ImageOver['Number02'] = new Image();
g_ImageOver['Number02'].src = IMAGES + '/mmorpg/number_02_over.gif';
g_ImageOver['Number03'] = new Image();
g_ImageOver['Number03'].src = IMAGES + '/mmorpg/number_03_over.gif';
g_ImageOver['Number04'] = new Image();
g_ImageOver['Number04'].src = IMAGES + '/mmorpg/number_04_over.gif';
g_ImageOver['Number05'] = new Image();
g_ImageOver['Number05'].src = IMAGES + '/mmorpg/number_05_over.gif';
g_ImageOver['Number06'] = new Image();
g_ImageOver['Number06'].src = IMAGES + '/mmorpg/number_06_over.gif';
g_ImageOver['Number07'] = new Image();
g_ImageOver['Number07'].src = IMAGES + '/mmorpg/number_07_over.gif';
g_ImageOver['Number08'] = new Image();
g_ImageOver['Number08'].src = IMAGES + '/mmorpg/number_08_over.gif';
g_ImageOver['PlayFree'] = new Image();
g_ImageOver['PlayFree'].src = IMAGES + '/mmorpg/join_now_over.png';
var g_ImageIdle = new Array();
g_ImageIdle['LeftArrow'] = new Image();
g_ImageIdle['LeftArrow'].src = IMAGES + '/mmorpg/navigation_arrow_left_idle.gif';
g_ImageIdle['RightArrow'] = new Image();
g_ImageIdle['RightArrow'].src = IMAGES + '/mmorpg/navigation_arrow_right_idle.gif';
g_ImageIdle['Number01'] = new Image();
g_ImageIdle['Number01'].src = IMAGES + '/mmorpg/number_01_idle.gif';
g_ImageIdle['Number02'] = new Image();
g_ImageIdle['Number02'].src = IMAGES + '/mmorpg/number_02_idle.gif';
g_ImageIdle['Number03'] = new Image();
g_ImageIdle['Number03'].src = IMAGES + '/mmorpg/number_03_idle.gif';
g_ImageIdle['Number04'] = new Image();
g_ImageIdle['Number04'].src = IMAGES + '/mmorpg/number_04_idle.gif';
g_ImageIdle['Number05'] = new Image();
g_ImageIdle['Number05'].src = IMAGES + '/mmorpg/number_05_idle.gif';
g_ImageIdle['Number06'] = new Image();
g_ImageIdle['Number06'].src = IMAGES + '/mmorpg/number_06_idle.gif';
g_ImageIdle['Number07'] = new Image();
g_ImageIdle['Number07'].src = IMAGES + '/mmorpg/number_07_idle.gif';
g_ImageIdle['Number08'] = new Image();
g_ImageIdle['Number08'].src = IMAGES + '/mmorpg/number_08_idle.gif';
g_ImageIdle['PlayFree'] = new Image();
g_ImageIdle['PlayFree'].src = IMAGES + '/mmorpg/join_now_idle.png';
// preload screenshots
var g_Screenshot = new Array();
g_Screenshot['Number01'] = new Image();
g_Screenshot['Number01'].src = IMAGES + '/mmorpg/screenshot_1.jpg';
g_Screenshot['Number02'] = new Image();
g_Screenshot['Number02'].src = IMAGES + '/mmorpg/screenshot_2.jpg';
g_Screenshot['Number03'] = new Image();
g_Screenshot['Number03'].src = IMAGES + '/mmorpg/screenshot_3.jpg';
g_Screenshot['Number04'] = new Image();
g_Screenshot['Number04'].src = IMAGES + '/mmorpg/screenshot_4.jpg';
g_Screenshot['Number05'] = new Image();
g_Screenshot['Number05'].src = IMAGES + '/mmorpg/screenshot_5.jpg';
g_Screenshot['Number06'] = new Image();
g_Screenshot['Number06'].src = IMAGES + '/mmorpg/screenshot_6.jpg';
g_Screenshot['Number07'] = new Image();
g_Screenshot['Number07'].src = IMAGES + '/mmorpg/screenshot_7.jpg';
g_Screenshot['Number08'] = new Image();
g_Screenshot['Number08'].src = IMAGES + '/mmorpg/screenshot_8.jpg';
// current selected screenshot
var g_SelectedScreenshot = 'Number01';

// mouse over effect
function MouseOver(a_Object)
{
  a_Object.style.backgroundImage = "url('" + g_ImageOver[a_Object.id].src + "')";
}

// mouse out effect
function MouseOut(a_Object)
{
  if (a_Object.id != g_SelectedScreenshot) 
  a_Object.style.backgroundImage = "url('" + g_ImageIdle[a_Object.id].src + "')";
}

// click events
function ChangeScreenshot(a_Object)
{
  var l_CurrentScreenshotNumber = g_SelectedScreenshot.substring(7, 8);
  var l_NewScreenshotNumber = 1;
  // set old number image to idle
  document.getElementById(g_SelectedScreenshot).style.backgroundImage = "url('" + g_ImageIdle[g_SelectedScreenshot].src + "')";
  // set the screenshot
  if (a_Object.id == 'LeftArrow') {
    if (l_CurrentScreenshotNumber == 1) {
      l_NewScreenshotNumber = 8;
    } else {
      l_NewScreenshotNumber = (parseInt(l_CurrentScreenshotNumber) - 1);
    }
    g_SelectedScreenshot = 'Number0' + l_NewScreenshotNumber;
    document.getElementById('ScreenShotContainer').style.backgroundImage = "url('" + g_Screenshot[g_SelectedScreenshot].src + "')";
  } else if (a_Object.id == 'RightArrow') {
  if (l_CurrentScreenshotNumber == 8) {
    l_NewScreenshotNumber = 1;
  } else {
    l_NewScreenshotNumber = (parseInt(l_CurrentScreenshotNumber) + 1);
  }
    g_SelectedScreenshot = 'Number0' + l_NewScreenshotNumber;
    document.getElementById('ScreenShotContainer').style.backgroundImage = "url('" + g_Screenshot[g_SelectedScreenshot].src + "')";
  } else {
    document.getElementById('ScreenShotContainer').style.backgroundImage = "url('" + g_Screenshot[a_Object.id].src + "')";
    g_SelectedScreenshot = a_Object.id;
  }
  // set the new number image to over
  document.getElementById(g_SelectedScreenshot).style.backgroundImage = "url('" + g_ImageOver[g_SelectedScreenshot].src + "')";
}
