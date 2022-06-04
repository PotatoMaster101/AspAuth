# ASP Auth
Sample project to play with ASP.NET's Identity authentication.

## Setup
Generate a dev HTTPS cert under `~/.aspnet/https` (see [link](https://docs.microsoft.com/en-us/aspnet/core/security/docker-https?view=aspnetcore-6.0)):
```
$ dotnet dev-certs https -ep "$HOME/.aspnet/https/auth.pfx" -p Password123!
$ dotnet dev-certs https --trust
```

Create DB migration:
```
$ dotnet ef migrations add InitialCreate --project src/AspAuth.Data --startup-project src/AspAuth.Web --context ApplicationDbContext
```

## Deploy (docker)
Run all containers:
```
$ docker compose up -d
```

## Deploy (locally)
1. Change the connection string in `Program.cs` to use `LocalAuthConnection`
2. Run postgres container: `docker compose up -d db`
3. Run webapp locally: `dotnet run --project src/AspAuth.Web -C Release`
