﻿FROM microsoft/dotnet-framework-build:4.7.2 AS build-env

 WORKDIR /app
 COPY . .

 RUN msbuild.exe /t:Build /p:Configuration=Release /p:OutputPath=out

 FROM microsoft/dotnet-framework:4.7.2
 WORKDIR /app
 COPY --from=build-env /app/out ./
 ENTRYPOINT ["dotnetapp.exe"]