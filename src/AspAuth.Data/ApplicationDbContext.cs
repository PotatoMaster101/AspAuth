using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;

namespace AspAuth.Data;

/// <summary>
/// Data context for Identity authentication.
/// </summary>
public class ApplicationDbContext : IdentityDbContext
{
    /// <summary>
    /// Constructs a new instance of <see cref="ApplicationDbContext"/>.
    /// </summary>
    /// <param name="options">The context options.</param>
    public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options) : base(options)
    { }
}
