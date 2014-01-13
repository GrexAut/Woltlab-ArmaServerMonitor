{include file='documentHeader'}

<head>
	<title>{lang}wcf.arma.headline{/lang}</title>
	
	{include file='headInclude'}

	<style type="text/css">	
                h2 {
                    font-size: 24px;
                    text-align: center;
                    padding-bottom: 25px;
                }
                h3 {
                    font-size: 16px;
                    text-align: center;
                    padding-bottom: 5px;
                }
                .left {
                    float: left;
                }
                .right {
                    float: right;
                }
                .clear {
                    float: none;
                    clear: both;
                }
                table.playerlist tbody{
                    height: 250px;
                    overflow-y: auto;
                }
                table.playerlist td, table.playerlist th {
                    text-align: center;
                }
                
                table.playerlist thead > tr, table.playerlist tbody {
                    display:block;
                }
                .container {
                    padding: 2%;
                    width: 50%;
                    margin: 0 auto;
                    margin-bottom: 1%;
                }
                .serverinfo > .serverinfo{
                    line-height: 20px;
                }
                .serverinfo > .left {
                    width: 50%;
                }
	</style>
</head>

<body id="tpl{$templateName|ucfirst}">


{include file='header' sidebarOrientation='right'}

<header class="boxHeadline">
	<h1>{lang}wcf.arma.headline{/lang}</span></h1>
</header>

{include file='userNotice'}

<div class="contentNavigation">
</div>
{foreach from=$servers item=$server}
    <div class="container marginTop">
        
        <div class="serverinfo left">
                <h2>{$server.serverInfo.hostname}</h2>
                <div class="left serverinfo">
                    {lang}wcf.arma.serverAddress{/lang}: {$server.serverInfo.serverAddress}<br />
                    {lang}wcf.arma.serverPort{/lang}: {$server.serverInfo.serverPort}<br />
                    {lang}wcf.arma.slots{/lang}: {$server.serverInfo.players}/{$server.serverInfo.maxplayers}<br />
                    {lang}wcf.arma.gamename{/lang}: {$server.serverInfo.gamename}<br />
                    {lang}wcf.arma.mapname{/lang}: {$server.serverInfo.mapname}<br />
                    {lang}wcf.arma.version{/lang}: {$server.serverInfo.version} ({lang}wcf.arma.version_required{/lang}: {$server.serverInfo.version_required})<br />
                    {lang}wcf.arma.platform{/lang}: {$server.serverInfo.platform}<br />
                    {lang}wcf.arma.startDate{/lang}: {@$server.serverInfo.startDate|time}
                </div>
                {if $server.descr}
                    <div class="left">
                        {$server.descr}
                    </div>
                {/if}
                <div class="clear"></div>
        </div>
        {if $server.players}
            <div class="left">
                <h3>{lang}wcf.arma.playerlist{/lang}</h3>
                <table class="table responsiveTable playerlist">
                    <thead>
                        <tr>
                            <th  width="250">{lang}wcf.arma.playername{/lang}</th><th  width="250">{lang}wcf.arma.kills{/lang}</th><th  width="250">{lang}wcf.arma.deaths{/lang}</th><th width=250>{lang}wcf.arma.score{/lang}</th>
                        </tr>
                    </thead>
                    <tbody>
                    {foreach from=$server.players item=$player}
                        <tr>
                            <td width="250">{$player.name}</td><td width="250">{$player.kills}</td><td width="250">{$player.deaths}</td><td width="250">{$player.score}</td>
                        </tr>
                    {/foreach}
                    </tbody>
                </table>
            </div>
        {/if}
        <div class="clear"></div>
    </div>
{/foreach}
<div class="contentNavigation">
	
	{hascontent}
		<nav>
			<ul>
				{content}
					{event name='contentNavigationButtonsBottom'}
				{/content}
			</ul>
		</nav>
	{/hascontent}
</div>

{include file='footer'}

</body>
</html>
