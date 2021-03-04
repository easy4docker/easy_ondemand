# -- Add docker app ... <%=@serverName %> --
cd <%=@dockerSettingPath %>

docker container stop <%=@siteContainer %>

docker container rm <%=@siteContainer %>

docker image rm -f <%=@siteImage %>

docker build -f <%=@dockerFile %> -t <%=@siteImage %> .

mkdir -p <%=@shareFolder %>

echo "{\n\t\"onDemandCallbackHost\": \"<%=@onDemandCallbackHost%>\",\n\t\"mainIP\": \"<%=@mainIP%>\",\n\t\"superPowerServer\": \"<%=@superPowerServer%>\"\n}" > <%=@shareFolder %>/onDemandSetting.json

echo "{\"code_folder\": \"<%=@dockerCodePath%>/app\", \"data_folder\": \"<%=@dockerDataPath%>\"}" > <%=@dockerDataPath%>/_env.json

#docker run -d --restart=on-failure --env mainIP="<%=@mainIP %>" --env onDemandCallbackHost="<%=@onDemandCallbackHost %>" --env superPowerServer="<%=@superPowerServer  %>" -v "<%=@shareFolder %>":/var/_shareFolder -v "<%=@dockerCodePath%>/app":/var/_localApp -v "<%=@dockerDataPath%>":/var/_localAppData --name <%=@siteContainer %>  <%=@siteImage %> 
docker run -d --restart=on-failure -v "<%=@shareFolder %>":/var/_shareFolder -v "<%=@dockerCodePath%>/app":/var/_localApp -v "<%=@dockerDataPath%>":/var/_localAppData --name <%=@siteContainer %>  <%=@siteImage %> 

