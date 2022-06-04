FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /src
COPY ["src/AspAuth.Data/AspAuth.Data.csproj", "AspAuth.Data/"]
COPY ["src/AspAuth.Web/AspAuth.Web.csproj", "AspAuth.Web/"]
RUN dotnet restore "AspAuth.Data/AspAuth.Data.csproj"
RUN dotnet restore "AspAuth.Web/AspAuth.Web.csproj"
COPY ["src/AspAuth.Data", "AspAuth.Data/"]
COPY ["src/AspAuth.Web", "AspAuth.Web/"]
WORKDIR /src/AspAuth.Web
RUN dotnet build "AspAuth.Web.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "AspAuth.Web.csproj" -c Release -o /app/publish

FROM mcr.microsoft.com/dotnet/aspnet:6.0-alpine3.15 AS production
WORKDIR /app
EXPOSE 80 443
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "AspAuth.Web.dll"]
