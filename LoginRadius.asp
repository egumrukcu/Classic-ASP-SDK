<!--#include file="json2.asp"-->
<%
Dim IsAuthenticat
Dim UserProfile

sub LoginRadius(Api_Secret)
	IsAuthenticat = false

	Dim rg
	Dim match
	Set rg = New RegExp
	rg.Pattern = "^(\{){0,1}[0-9a-fA-F]{8}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{12}(\}){0,1}$"

	match = rg.Test(Api_Secret)

	If(match) Then

        If Not (Request.Form("token") = "" ) then

	        Dim url
            url = "https://hub.loginradius.com/userprofile.ashx?token=" & Request.Form("token") & "&apisecrete=" & Api_Secret

            Dim ResponseJson
            ResponseJson = getHTML(url)

            IsAuthenticat = true

            Set UserProfile = JSON.parse(ResponseJson)
        End If
	Else
		'I dont know how to throw exception in classic asp I serched but didn't find solution
	End If
End Sub

Function  getHTML (strUrl)

    Dim Httpreq: set Httpreq = Server.Createobject("MSXML2.ServerXMLHTTP")
    Httpreq.Open "GET", strUrl, False

    Httpreq.Send
    getHTML = Httpreq.responseText
    Httpreq.abort()

End Function

%>