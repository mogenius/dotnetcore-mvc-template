FROM microsoft/aspnetcore-build:6.0 AS build
WORKDIR /app
COPY *.csproj ./
RUN dotnet restore

COPY . ./

RUN dotnet publish -c Release -o out

FROM microsoft/aspnetcore:6.0
WORKDIR /app
COPY --from=build-env /app/out .
ENTRYPOINT ["dotnet", "NetCoreProject.dll"]
