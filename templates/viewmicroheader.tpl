<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html{if $LANGDIRECTION == 'rtl'} dir="rtl"{/if}>
{include file="header/head.tpl"}
<body id="micro">
{if $USERMASQUERADING}<div class="sitemessage"><img src="{theme_url filename='images/icon_problem.gif'}" alt="">{$masqueradedetails} {$becomeyouagain|safe}</div>{/if}
{if $SITECLOSED}<div class="sitemessage center">{if $SITECLOSED == 'logindisabled'}{str tag=siteclosedlogindisabled section=mahara arg1="`$WWWROOT`admin/upgrade.php"}{else}{str tag=siteclosed}{/if}</div>{/if}
{if $collection}
        <div class="left cb" id="collection">{include file=collectionnav.tpl}</div>
{else}
        <div class="center cb title">{$microheadertitle|safe}</div>
{/if}
<div id="containerX">
    <div id="loading-box"></div>
    <div id="top-wrapper">
      <div class="viewheader top">
        <div class="fr links">
          {if $microheaderlinks}
            {foreach from=$microheaderlinks item=item}
              <a {if $item.type}class="icon btn-{$item.type}" {/if}href="{$item.url}">{$item.name}</a> 
            {/foreach}
          {elseif $backurl}<a class="icon btn-back" href="{$backurl}">{str tag=back}</a> 
          {/if}
        </div>
        <div class="fl">
          <a class="small-logo" href="{$WWWROOT}"><img src="{theme_url filename='images/site-logo-small.png'}" alt="{$sitename}"></a>
        </div>
{if $LOGGEDIN}
        <div id="mainnav-container" class="nav">
         <div id="mainnav" class="js-hidden">
          <strong><a href="{$WWWROOT}user/view.php">{$USER|display_name:null:true|escape}</a>:</strong> 
          {foreach from=$MAINNAV item=item}
            {if $item.path}
              <a href="{if $item.url=='account/' && get_config('httpswwwroot')}{$HTTPSWWWROOT}{else}{$WWWROOT}{/if}{$item.url}">{$item.title}</a> | 
            {/if}
          {/foreach}
          {if $USER->get('admin')}
            <a href="{$WWWROOT}admin/">{str tag="siteadministration"}</a> |
          {elseif $USER->is_institutional_admin()}
            <a href="{$WWWROOT}admin/users/search.php">{str tag="useradministration"}</a> |
          {/if}

          {if $mnethost}<a href="{$mnethost.url}">{str tag=backto arg1=$mnethost.name}</a>&nbsp;{/if}
          <a href="{$WWWROOT}?logout">{str tag="logout"}</a>
        </div>
        <script>{literal}
        addLoadEvent(function(){
            setStyle('mainnav', {'display': 'none'});
            removeElementClass('mainnav', 'js-hidden');
            connect('mainnav-container', 'onmouseenter', function(e) { appear('mainnav', {'duration': 0.25}); });
            connect('mainnav-container', 'onmouseleave', function(e) { fade('mainnav', {'duration': 0.25}); });
        });
        {/literal}
        </script>
       </div>
{/if}
      </div>
	  
      <div class="viewheader">


      </div>
    </div>
    <div id="main-wrapper">
        <div class="main-column">
            {dynamic}{insert_messages}{/dynamic}
            <div id="main-column-container">
