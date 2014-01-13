{include file='header' pageTitle='wcf.acp.arma.'|concat:$action}


<header class="boxHeadline">
	<h1>{lang}wcf.acp.arma.{$action}{/lang}</h1>
</header>

{include file='formError'}

{if $success|isset}
	<p class="success">{lang}wcf.global.success.{$action}{/lang}</p>
{/if}

<div class="contentNavigation">
	<nav>
		<ul>
			<li><a href="{link controller='ArmaList'}{/link}" class="button"><span class="icon icon16 icon-list"></span> <span>{lang}wcf.acp.menu.link.community.arma.list{/lang}</span></a></li>
			
			{event name='contentNavigationButtons'}
		</ul>
	</nav>
</div>

<form method="post" action="{if $action == 'add'}{link controller='ArmaAdd'}{/link}{else}{link controller='ArmaEdit' id=$arma->serverID}{/link}{/if}">
	<div class="container containerPadding marginTop">
		<fieldset>
			<legend>{lang}wcf.global.form.data{/lang}</legend>
			
			
			<dl{if $errorField == 'serverID'} class="formError"{/if}>
				<dt><label for="serverID">{lang}wcf.acp.arma.serverID{/lang}</label></dt>
				<dd>
					<input type="text" id="serverID" name="serverID" value="{$serverID}" class="short" required="required" />
					{if $errorField == 'serverID'}
						<small class="innerError">{lang}wcf.acp.arma.serverID.error.{$errorType}{/lang}</small>
					{/if}
				</dd>
			</dl>
			<dl{if $errorField == 'serverVersion'} class="formError"{/if}>
				<dt><label for="serverVersion">{lang}wcf.acp.arma.serverVersion{/lang}</label></dt>
				<dd>
					<input type="radio" id="arma2" name="serverVersion" value="arma2" {if $serverVersion == "arma2"}checked{/if} /> ARMA II<br />
					<input type="radio" id="arma3" name="serverVersion" value="arma3" {if $serverVersion == "arma3"}checked{/if} /> ARMA III
					{if $errorField == 'serverVersion'}
						<small class="innerError">{lang}wcf.acp.arma.serverVersion.error.{$errorType}{/lang}</small>
					{/if}
				</dd>
			</dl>
			<dl{if $errorField == 'descr'} class="formError"{/if}>
				<dt><label for="descr">{lang}wcf.acp.arma.description{/lang}</label></dt>
				<dd>
                                        <textarea id="descr" name="descr" rows=10>{$descr}</textarea>
					{if $errorField == 'descr'}
						<small class="innerError">{lang}wcf.acp.arma.descr.error.{$errorType}{/lang}</small>
					{/if}
				</dd>
			</dl>
			
			{event name='dataFields'}
		</fieldset>
		
	</div>
	
	<div class="formSubmit">
		<input type="submit" value="{lang}wcf.global.button.submit{/lang}" accesskey="s" />
		{@SECURITY_TOKEN_INPUT_TAG}
	</div>
</form>

{include file='footer'}