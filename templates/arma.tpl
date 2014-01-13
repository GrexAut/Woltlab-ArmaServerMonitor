{include file='documentHeader'}

<head>
	<title>{lang}wcf.samp.headline{/lang}</title>
	
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
                }
                .serverinfo {
                    line-height: 25px;
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
    <h2></h2>
    <div class="container marginTop">
        <div class="serverinfo left">
                <h2>{$serverInfo.hostname}</h2>
                {lang}wcf.arma.serverAddress{/lang}: {$serverInfo.serverAddress}<br />
                {lang}wcf.arma.serverPort{/lang}: {$serverInfo.serverPort}<br />
                {lang}wcf.arma.slots{/lang}: {$serverInfo.players}/{$serverInfo.maxplayers}<br />
                {lang}wcf.arma.gamename{/lang}: {$serverInfo.gamename}<br />
                {lang}wcf.arma.mapname{/lang}: {$serverInfo.mapname}<br />
                {lang}wcf.arma.version{/lang}: {$serverInfo.version} ({lang}wcf.arma.version_required{/lang}: {$serverInfo.version_required})<br />
                {lang}wcf.arma.platform{/lang}: {$serverInfo.platform}<br />
                {lang}wcf.arma.startDate{/lang}: {@$serverInfo.startDate|time}
        </div>
        <div class="left">
            <h3>{lang}wcf.arma.playerlist{/lang}</h3>
            <table class="table responsiveTable playerlist">
                <thead>
                    <tr>
                        <th  width="250">{lang}wcf.arma.playername{/lang}</th><th  width="250">{lang}wcf.arma.kills{/lang}</th><th  width="250">{lang}wcf.arma.deaths{/lang}</th><th width=250>{lang}wcf.arma.score{/lang}</th>
                    </tr>
                </thead>
                <tbody>
                {foreach from=$players item=$player}
                    <tr>
                        <td width="250">{$player.name}</td><td width="250">{$player.kills}</td><td width="250">{$player.deaths}</td><td width="250">{$player.score}</td>
                    </tr>
                {/foreach}
                </tbody>
            </table>
        </div>
        <div class="clear"></div>
    </div>
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
