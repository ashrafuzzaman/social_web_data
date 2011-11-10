<html>
<head>
<style type="text/css">
body {
	color: #4f6b72;
	background: #E6EAE9;
    margin:50px 0px; padding:0px;
	text-align:center;
}

.center {
    width:800px;
	margin:0px auto;
	text-align:left;
	padding:15px;
}

a {
	color: #c75f3e;
}

table {
    width:800px;
	font: 11px;
	padding: 0;
	margin: 10px;
}


th {
	font: bold 14px;
	color: #4f6b72;
	border: 1px solid #C1DAD7;
	text-align: left;
	padding: 6px 6px 6px 12px;
	background: #CAE8EA url(bg_header.jpg) repeat-x;
}

td {
	border-right: 1px solid #C1DAD7;
	border-bottom: 1px solid #C1DAD7;
	background: #fff;
	padding: 6px 6px 6px 12px;
	color: #4f6b72;
}

td.alt {
	background: #F5FAFA;
	color: #797268;
}

</style>
</head>
<body>
<div class="center">
<h1>API</h1>
<div>${description}</div>
<#list apis as api>
    <table cellspacing="0">
        <th colspan="2">${api.title}</th>
        <tr>
            <td width="150px"><b>Path</b></td>
            <td>${api.url}</td>
        </tr>
        <tr>
            <td width="150px"><b>HTTP method</b></td>
            <td>${api.method}</td>
        </tr>
        <#if api.params?exists>
            <tr colspan="2"><td class="alt" colspan="2"><b>Params</b></td></tr>
            <#list api.params as param>
            <tr>
                <td class=”${["alt", ""][param_index%2]}” width="150px"><b>${param.name}</b></td>
                <td class=”${["alt", ""][param_index%2]}”>${param.description}</td>
            </tr>
            </#list>
        </#if>
        <tr>
            <td width="150px"><b>Description</b></td>
            <td>${api.description}</td>
        </tr>
    </table>
</#list>
</div>
</body>
</html>