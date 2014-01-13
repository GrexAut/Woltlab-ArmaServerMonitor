{include file='header' pageTitle='wcf.acp.arma.list'}

<header class="boxHeadline">
	<h1>{lang}wcf.acp.arma.list{/lang}</h1>
	<script data-relocate="true">
		//<![CDATA[
		$(function() {
			new WCF.Action.Delete('wcf\\data\\arma\\ArmaAction', '.jsArmaRow');
			new WCF.Action.Toggle('wcf\\data\\arma\\ArmaAction', $('.jsArmaRow'));
		});
		//]]>
	</script>
</header>

<div class="contentNavigation">
	{pages print=true assign=pagesLinks controller="ArmaServerList" link="pageNo=%d&sortField=$sortField&sortOrder=$sortOrder"}
	
	<nav>
		<ul>
			<li><a href="{link controller='ArmaAdd'}{/link}" class="button"><span class="icon icon16 icon-plus"></span> <span>{lang}wcf.acp.arma.add{/lang}</span></a></li>
			
			{event name='contentNavigationButtonsTop'}
		</ul>
	</nav>
</div>

{if $objects|count}
	<div class="tabularBox tabularBoxTitle marginTop">
		<header>
			<h2>{lang}wcf.acp.arma.list{/lang} <span class="badge badgeInverse">{#$items}</span></h2>
		</header>
		
		<table class="table">
			<thead>
				<tr>
					<th class="columnID columnServerID{if $sortField == 'serverID'} active {@$sortOrder}{/if}" colspan="2"><a href="{link controller='ArmaList'}pageNo={@$pageNo}&sortField=serverID&sortOrder={if $sortField == 'serverID' && $sortOrder == 'ASC'}DESC{else}ASC{/if}{/link}">{lang}wcf.acp.arma.serverID{/lang}</a></th>
					<th class="columnTitle columnServerVersion{if $sortField == 'serverVersion'} active {@$sortOrder}{/if}"><a href="{link controller='ArmaList'}pageNo={@$pageNo}&sortField=serverVersion&sortOrder={if $sortField == 'serverVersion' && $sortOrder == 'ASC'}DESC{else}ASC{/if}{/link}">{lang}wcf.acp.arma.serverVersion{/lang}</a></th>
					<th class="columnText columnDescr{if $sortField == 'descr'} active {@$sortOrder}{/if}"><a href="{link controller='ArmaList'}pageNo={@$pageNo}&sortField=descr&sortOrder={if $sortField == 'descr' && $sortOrder == 'ASC'}DESC{else}ASC{/if}{/link}">{lang}wcf.acp.arma.descr{/lang}</a></th>
					
					{event name='columnHeads'}
				</tr>
			</thead>
			
			<tbody>
				{foreach from=$objects item=arma}
					<tr class="jsArmaRow">
						<td class="columnIcon">
							<span class="icon icon16 icon-check{if $arma->active == false}-empty{/if} jsToggleButton jsTooltip pointer" title="{lang}wcf.global.button.{if $arma->active == false}enable{else}disable{/if}{/lang}" data-object-id="{@$arma->serverID}" data-disable-message="{lang}wcf.global.button.disable{/lang}" data-enable-message="{lang}wcf.global.button.enable{/lang}"></span>
							<a href="{link controller='ArmaEdit' id=$arma->serverID}{/link}" title="{lang}wcf.global.button.edit{/lang}" class="jsTooltip"><span class="icon icon16 icon-pencil"></span></a>
							<span class="icon icon16 icon-remove jsDeleteButton jsTooltip pointer" title="{lang}wcf.global.button.delete{/lang}" data-object-id="{@$arma->serverID}" data-confirm-message="{lang}wcf.acp.arma.delete.sure{/lang}"></span>
							
							{event name='rowButtons'}
						</td>
						<td class="columnID">{@$arma->serverID}</td>
						<td class="columnTitle columnServerVersion">{$arma->serverVersion}</td>
						<td class="columnText columnDescr">{$arma->descr}</td>
						
						{event name='columns'}
					</tr>
				{/foreach}
			</tbody>
		</table>
		
	</div>
	
	<div class="contentNavigation">
		{@$pagesLinks}
		
		<nav>
			<ul>
				{event name='contentNavigationButtonsBottom'}
			</ul>
		</nav>
	</div>
{else}
	<p class="info">{lang}wcf.global.noItems{/lang}</p>
{/if}

{include file='footer'}
