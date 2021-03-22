# -- Add docker app ... <%=@serverName %> --
cd <%=@dockerSettingPath %>

docker container stop <%=@siteContainer %>

docker container rm <%=@siteContainer %>

docker image rm -f <%=@siteImage %>

docker build -f <%=@dockerFile %> -t <%=@siteImage %> .

mkdir -p <%=@shareFolder %>/input
mkdir -p <%=@shareFolder %>/output
chmod 777 <%=@shareFolder %>/input
chmod 777 <%=@shareFolder %>/output

mv <%=@dockerDataPath%>/commCronData/* <%=@shareFolder %>/input/


echo "{\n\t\"onDemandCallbackHost\": \"<%=@onDemandCallbackHost%>\",\n\t\"mainIP\": \"<%=@mainIP%>\",\n\t\"superPowerServer\": \"<%=@superPowerServer%>\"\n}" > <%=@shareFolder %>/input/_dockerSetting.json

echo "{\"code_folder\": \"<%=@dockerCodePath%>/app\", \"data_folder\": \"<%=@dockerDataPath%>\"}" > <%=@dockerDataPath%>/_env.json

# docker run -d --restart=on-failure -v "<%=@shareFolder %>":/var/_sharedFolder -v "<%=@dockerCodePath%>/app":/var/_localApp -v "<%=@dockerDataPath%>":/var/_localAppData --name <%=@siteContainer %>  <%=@siteImage %> 

echo "0009" >> "<%=@shareFolder %>/mmm.txt

docker run -d --restart=no -v "<%=@shareFolder %>":/var/_sharedFolder -v "<%=@dockerCodePath%>/app":/var/_localApp -v "<%=@dockerDataPath%>":/var/_localAppData --name <%=@siteContainer %>  <%=@siteImage %> 
