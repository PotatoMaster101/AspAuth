using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace AspAuth.Web.Pages;

[Authorize]
public class SampleModel : PageModel
{
}
