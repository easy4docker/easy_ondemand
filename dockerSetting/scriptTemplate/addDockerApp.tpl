# -- Add docker app ... <%=@serverName %> --
cd <%=@dockerSettingPath %>

docker container stop <%=@siteContainer %>

docker container rm <%=@siteContainer %>

docker image rm -f <%=@siteImage %>

docker build -f <%=@dockerFile %> -t <%=@siteImage %> .

docker run -d --restart=on-failure --env mainIP="<%=@mainIP %>" --env onDemandCallbackHost="<%=@onDemandCallbackHost %>" --env superPowerServer="<%=@superPowerServer  %>" -v "<%=@shareFolder %>":/var/_shareFolder -v "<%=@dockerCodePath%>/app":/var/_localApp -v "<%=@dockerDataPath%>":/var/_localAppData --name <%=@siteContainer %>  <%=@siteImage %> 

echo "{\"code_folder\": \"<%=@dockerCodePath%>/app\", \"data_folder\": \"<%=@dockerDataPath%>\"}" > <%=@dockerDataPath%>/_env.json
